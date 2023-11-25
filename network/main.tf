module "vpc" {
  source            = "./modules/vpc"
  project           = var.project
  environment       = var.environment
  environment_short = var.environment_short
  cidr_block        = var.cidr_block
}

module "internet_gateway" {
  source            = "./modules/internet_gateway"
  project           = var.project
  environment       = var.environment
  environment_short = var.environment_short
  vpc_id            = module.vpc.id
}

module "subnet" {
  source             = "./modules/subnet"
  project            = var.project
  environment        = var.environment
  environment_short  = var.environment_short
  vpc_id             = module.vpc.id
  cidr_block         = var.cidr_block
  availability_zones = split(",", var.availability_zones)
}
