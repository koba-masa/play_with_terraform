module "template" {
  source            = "./modules/template"
  project           = var.project
  environment       = var.environment
  environment_short = var.environment_short
}
