module "policy_for_common_user" {
  source      = "./modules/policy"
  project     = var.project
  environment = var.environment
}
