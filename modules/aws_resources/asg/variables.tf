

# ubuntu-trusty-14.04 (x64)
variable "aws_amis" {
  default = ""
}

variable "availability_zones" {
  default     = ""

}

variable "elb_name" {}

variable "key_name" {
  description = "Name of AWS key pair"
}


variable "instance_type" {
  default     = "t2.micro"
  description = "AWS instance type"
}


variable "asg_min" {
  description = "Min numbers of servers in ASG"
  default     = "1"
}



variable "asg_max" {
  description = "Max numbers of servers in ASG"
  default     = "2"
}




variable "asg_desired" {
  description = "Desired numbers of servers in ASG"
  default     = "1"
}
