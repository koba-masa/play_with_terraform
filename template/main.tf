module "template" {
  source      = "./modules/template"
  project     = var.project
  environment = var.environment
}
