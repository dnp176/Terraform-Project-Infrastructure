resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids

  user_data = var.user_data != "" ? file(var.user_data) : null

  tags = merge(
    {
      Name = "${var.env}-${var.instance_name}"
    },
    var.extra_tags
  )
}
