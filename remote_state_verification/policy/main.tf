module "policy_for_common_user" {
  source      = "./modules/policy"
  project     = var.project
  environment = var.environment
  user_name   = data.terraform_remote_state.remote_state.outputs.export.users.common_user_name
}
