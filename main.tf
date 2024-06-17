data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_name           = var.vpc_name
  vpc_cidr           = var.vpc_cidr
  availability_zones = data.aws_availability_zones.available.names
}

module "load_balancer" {
  source = "./modules/load_balancer"

  load_balancer_name       = "${var.project_name}-lb"
  vpc_id                   = module.vpc.vpc_id
  load_balancer_subnet_ids = module.vpc.public_subnets

  depends_on = [module.vpc]
}
