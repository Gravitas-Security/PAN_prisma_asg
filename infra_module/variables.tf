# Variables
variable "ztna_asg" {
  description = "ZTNA Connector Auto Scaling Group"
  type        = map(object({
    min_size = number
    max_size = number
    nw_bw_percent = string
    region = string
    vpc = string
  }))
}
