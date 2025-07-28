variable "env" {
  type        = string
  description = "Environment name"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the Security Group"
}

variable "default_ports" {
  type        = list(number)
  description = "Default ports for all environments"
  default     = [22, 80, 443]
}

variable "extra_ports" {
  type        = list(number)
  description = "Additional ports for environment-specific needs"
  default     = []
}

variable "extra_tags" {
  type    = map(string)
  default = {}
}
