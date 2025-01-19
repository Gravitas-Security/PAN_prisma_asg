resource "aws_security_group" "ztnasg" {
  for_each = var.ztna_asg
  name        = "${each.key}-security-group"
  description = "ZTNA Connector Allow Egress SG"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = each.value.vpc
}

data "aws_subnets" "ztna_priv_subnets" {
  for_each = var.ztna_asg

  filter {
    name   = "tag:Name"
    values = ["*private*"]
  }
  filter {
    name   = "vpc-id"
    values = [each.value.vpc]
  }
}

resource "aws_launch_template" "my_ec2_launch_template" {
  for_each = var.ztna_asg
  name     = "${each.key}-launch-template"

  instance_type = local.instance_map["ion200v"]
  image_id      = local.region_map["${each.value.region}"]

  network_interfaces {
    description    = "Single interface - 1arm"
    subnet_id      = data.aws_subnets.ztna_priv_subnets[each.key].ids[0]  # Reference the first subnet ID from the data source
    device_index   = 0
    security_groups = [aws_security_group.ztnasg[each.key].id]  # Corrected this reference
  }

  user_data = base64encode(<<EOF
General:
    model: ion 200v
License:
    key: $ION_KEY
    secret: $ION_SECRET
EOF
  )
}

resource "aws_autoscaling_group" "my_asg" {
  for_each = var.ztna_asg
  name               = "${each.key}-autoscaling-group"
  min_size           = each.value.min_size
  max_size           = each.value.max_size
  health_check_grace_period = 900

  launch_template {
    id      = aws_launch_template.my_ec2_launch_template[each.key].id  # Corrected this reference
    version = "$Latest"
  }

  # Specify multiple subnets for the Auto Scaling Group
  vpc_zone_identifier = data.aws_subnets.ztna_priv_subnets[each.key].ids  # Multiple subnets here

  tag {
    key                 = "Name"
    value               = "${each.key}-asg-vm"
    propagate_at_launch = true
  }
}
