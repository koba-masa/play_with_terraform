module "vpc" {
  source            = "./modules/vpc"
  project           = var.project
  environment       = var.environment
  environment_short = var.environment_short
  cidr_block        = var.cidr_block
}

module "security_group" {
  source            = "./modules/security_group"
  project           = var.project
  environment       = var.environment
  environment_short = var.environment_short
  vpc_id            = module.vpc.id
}

module "subnet_group" {
  source             = "./modules/rds/subnet_group"
  project            = var.project
  environment        = var.environment
  environment_short  = var.environment_short
  vpc_id             = module.vpc.id
  cidr_block         = var.cidr_block
  availability_zones = split(",", var.availability_zones)
}

# module "cluster" {
#   source                    = "./modules/rds/cluster"
#   project                   = var.project
#   environment               = var.environment
#   environment_short         = var.environment_short
#   availability_zones        = split(",", var.availability_zones)
#   db_subnet_group_name      = module.subnet_group.name
#   master_password          = var.master_password
#   security_group_id        = module.security_group.id
# }
