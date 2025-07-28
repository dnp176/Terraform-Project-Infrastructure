variable "vpc_cidr" {
  type        = string
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_count" {
  type        = number
  description = "Number of subnets"
  default     = 2
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
}

variable "env" {
  type        = string
  description = "Environment name"
}

variable "extra_tags" {
  type        = map(string)
  default     = {}
}
