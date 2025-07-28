resource "aws_security_group" "this" {
  name        = "${var.env}-common-sg"
  description = "Common Security Group for ${var.env} environment"
  vpc_id      = var.vpc_id

  tags = merge(
    {
      Name = "${var.env}-common-sg"
    },
    var.extra_tags
  )
}

# ✅ Default ingress rules
resource "aws_security_group_rule" "default_ingress" {
  for_each = toset([for p in var.default_ports : tostring(p)])

  type              = "ingress"
  from_port         = tonumber(each.key)
  to_port           = tonumber(each.key)
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}


# ✅ Extra ingress rules (environment specific)
resource "aws_security_group_rule" "extra_ingress" {
  for_each = toset([for p in var.extra_ports : tostring(p)])

  type              = "ingress"
  from_port         = tonumber(each.key)
  to_port           = tonumber(each.key)
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}


# ✅ Allow all egress
resource "aws_security_group_rule" "allow_all_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}
