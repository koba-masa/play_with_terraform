module "vpc" {
  source            = "./modules/vpc"
  project           = var.project
  environment       = var.environment
  environment_short = var.environment_short
  cidr_block        = "10.1.0.0/16"
}

module "security_group" {
  source            = "./modules/security_group"
  project           = var.project
  environment       = var.environment
  environment_short = var.environment_short
  vpc_id            = module.vpc.id
}
