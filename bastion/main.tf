module "bastion_key_pair" {
  source            = "./modules/key_pair"
  project           = var.project
  environment       = var.environment
  environment_short = var.environment_short
}

module "bastion_role" {
  source            = "./modules/role/bastion"
  project           = var.project
  environment       = var.environment
  environment_short = var.environment_short
}

module "security_group" {
  source            = "./modules/security_group"
  project           = var.project
  environment       = var.environment
  environment_short = var.environment_short
  vpc_id            = data.terraform_remote_state.remote_state.outputs.export.vpc_id
}

module "bastion" {
  source               = "./modules/instance"
  project              = var.project
  environment          = var.environment
  environment_short    = var.environment_short
  subnet_id            = data.terraform_remote_state.remote_state.outputs.export.public_subnet_ids[0]
  security_groups      = [module.security_group.id]
  key_name             = module.bastion_key_pair.key_name
  iam_instance_profile = module.bastion_role.profile_name
}

module "event_bridge_role" {
  source            = "./modules/role/stopping"
  project           = var.project
  environment       = var.environment
  environment_short = var.environment_short
  bastion_arn       = module.bastion.arn
}

module "event_bridge" {
  source            = "./modules/event_bridge"
  project           = var.project
  environment       = var.environment
  environment_short = var.environment_short
  bastion_id        = module.bastion.id
  role_arn          = module.event_bridge_role.arn
}
