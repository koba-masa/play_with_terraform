module "role" {
  source      = "./modules/role"
  project     = var.project
  environment = var.environment
}
