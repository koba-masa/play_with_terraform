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
  vpc_id            = var.vpc_id
}

module "bastion" {
  source               = "./modules/instance"
  project              = var.project
  environment          = var.environment
  environment_short    = var.environment_short
  subnet_id            = var.subnet_id
  security_groups      = [module.security_group.id]
  key_name             = module.bastion_key_pair.key_name
  iam_instance_profile = module.bastion_role.profile_name
}
