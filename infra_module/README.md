# ZTNA Connector Auto Scaling Group Module

This Terraform module creates an Auto Scaling Group (ASG) for ZTNA Connectors in AWS. It includes resources for security groups, launch templates, and the ASG itself.

## Usage

To use this module, include it in your Terraform configuration as shown below:

```hcl
module "ztna_asg" {
    source = "../infra_module"
    ztna_asg = {
        dev_asg = {
            min_size = 2
            max_size = 4
            nw_bw_percent = "70"
            region = "us-east-1"
            vpc = "vpc-8576jhvmnb"
        }
    }
}
```

### Inputs

- `min_size`: The minimum size of the ASG.
- `max_size`: The maximum size of the ASG.
- `nw_bw_percent`: The network bandwidth percentage.
- `region`: The AWS region where the ASG will be created.
- `vpc`: The VPC ID where the ASG will be deployed.

### Outputs

- `asg_id`: The ID of the created Auto Scaling Group.
- `launch_template_id`: The ID of the created launch template.
- `security_group_id`: The ID of the created security group.

### Example

```hcl
module "ztna_asg" {
    source = "../infra_module"
    ztna_asg = {
        dev_asg = {
            min_size = 2
            max_size = 4
            nw_bw_percent = "70"
            region = "us-east-1"
            vpc = "vpc-7685yhghjv"
        }
    }
}
```