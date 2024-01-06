module "bucket" {
  source      = "./modules/s3"
  project     = var.project
  environment = var.environment
}

module "role" {
  source      = "./modules/role"
  project     = var.project
  environment = var.environment
}
