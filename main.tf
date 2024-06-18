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

module "rds" {
  source             = "./modules/rds"
  rds_instance_name  = var.project_name
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.private_subnets
  availability_zones = data.aws_availability_zones.available.names

  depends_on = [module.vpc]
}

module "iam" {
  source = "./modules/iam"
}

module "autoscaling" {
  source = "./modules/autoscaling"

  autoscaling_group_name = var.project_name

  ami_id                       = "ami-041764f30a2c940a4"
  instance_type                = "t2.micro"
  volume_size                  = 150
  iam_instance_profile_name    = module.iam.ec2_ssm_instance_profile_name
  autoscaling_max_size         = 1
  autoscaling_min_size         = 1
  autoscaling_desired_capacity = 1

  load_balancer                   = module.load_balancer.load_balancer
  target_group                    = module.load_balancer.target_group
  load_balancer_security_group_id = module.load_balancer.load_balancer_security_group_id

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  project_name = var.project_name

  depends_on = [module.vpc, module.load_balancer, module.iam]
}

module "s3" {
  source = "./modules/s3"

  bucket_name = "${var.project_name}-${var.environment}"
}
