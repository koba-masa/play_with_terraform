module "user" {
  source      = "./modules/user"
  project     = var.project
  environment = var.environment
  identifier  = var.identifier
}
