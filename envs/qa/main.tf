provider "aws" {
  region = "ap-south-1"
}

# ✅ Commented default VPC logic
# data "aws_vpc" "default" {
#   default = true
# }
# data "aws_subnets" "default" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.default.id]
#   }
# }

# ✅ Create VPC
module "vpc_dev" {
  source        = "../../modules/vpc"
  vpc_cidr      = "10.0.0.0/16"
  subnet_count  = 2
  azs           = ["ap-south-1a", "ap-south-1b"]
  env           = var.ENV_NAME
}

# ✅ Create Security Group
module "sg_dev" {
  source       = "../../modules/SG"
  vpc_id       = module.vpc_dev.vpc_id
  env          = var.ENV_NAME
  extra_ports  = [8080] # ✅ Dev-specific port
}

# ✅ Create EC2
module "ec2_dev" {
  source        = "../../modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(module.vpc_dev.subnet_ids, 0)
  key_name      = var.key_name
  instance_name = "EC2"
  env           = var.ENV_NAME

  user_data     = "${path.module}/../../scripts/qa-init.sh"

  # ✅ Attach SG
  vpc_security_group_ids = [module.sg_dev.sg_id]
}
