variable "ENV_NAME" {
  type        = string
  description = "Environment Name"
  default     = ""
}
variable "ami_id" {
  type = string
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "key_name" {
  type = string
}
variable "user_data" {
  type        = string
  description = "User data script to run on instance launch"
  default     = ""
}
