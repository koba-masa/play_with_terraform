module "security_group" {
  source                    = "./modules/security_group"
  project                   = var.project
  environment               = var.environment
  environment_short         = var.environment_short
  vpc_id                    = data.terraform_remote_state.remote_state.outputs.export.vpc_id
  bastion_security_group_id = data.terraform_remote_state.remote_state.outputs.export.bastion_security_group_id
}
