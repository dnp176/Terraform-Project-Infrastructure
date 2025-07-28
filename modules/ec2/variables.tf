variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID to launch EC2 instance"
}

variable "key_name" {
  type        = string
  description = "Key pair name"
}

variable "instance_name" {
  type        = string
  description = "Name tag for the EC2 instance"
  default     = "MyEC2"
}

variable "extra_tags" {
  type        = map(string)
  description = "Additional tags for the EC2 instance"
  default     = {}
}
variable "user_data" {
  type        = string
  description = "Path to shell script for user_data"
  default     = ""
}
variable "env" {
  type        = string
  description = "Environment name"
}
variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of Security Group IDs to attach to EC2"
  default     = []
}

