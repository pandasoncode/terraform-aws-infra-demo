data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_name           = var.vpc_name
  vpc_cidr           = var.vpc_cidr
  availability_zones = data.aws_availability_zones.available.names
}
