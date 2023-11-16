module "bastion_role" {
  source            = "./modules/role"
  project           = var.project
  environment       = var.environment
  environment_short = var.environment_short
}

module "bastion" {
  source               = "./modules/ec2"
  project              = var.project
  environment          = var.environment
  environment_short    = var.environment_short
  subnet_id            = var.subnet_id
  security_groups      = split(",", var.security_groups)
  key_name             = var.key_name
  iam_instance_profile = module.bastion_role.profile_name
}
