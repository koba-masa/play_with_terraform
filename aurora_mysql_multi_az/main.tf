module "security_group" {
  source                    = "./modules/security_group"
  project                   = var.project
  environment               = var.environment
  environment_short         = var.environment_short
  vpc_id                    = data.terraform_remote_state.remote_state.outputs.export.vpc_id
  bastion_security_group_id = data.terraform_remote_state.remote_state.outputs.export.bastion_security_group_id
}

module "subnet_group" {
  source             = "./modules/rds/subnet_group"
  project            = var.project
  environment        = var.environment
  environment_short  = var.environment_short
  vpc_id             = data.terraform_remote_state.remote_state.outputs.export.vpc_id
  cidr_block         = data.terraform_remote_state.remote_state.outputs.export.vpc_cidr_block
  availability_zones = data.terraform_remote_state.remote_state.outputs.export.availability_zones
}

module "monitoring_role" {
  source            = "./modules/role"
  project           = var.project
  environment       = var.environment
  environment_short = var.environment_short
}

