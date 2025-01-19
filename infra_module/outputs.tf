# Outputs
output "instance_id" {
  description = "InstanceId of the newly created AutoScalingGroup instance"
  value       = aws_autoscaling_group.my_asg[*]
}
