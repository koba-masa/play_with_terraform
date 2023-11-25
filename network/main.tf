module "vpc" {
  source            = "./modules/vpc"
  project           = var.project
  environment       = var.environment
  environment_short = var.environment_short
  cidr_block        = var.cidr_block
}
