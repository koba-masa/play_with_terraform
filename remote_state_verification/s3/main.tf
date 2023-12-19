module "s3_bucket" {
  source      = "./modules/s3"
  project     = var.project
  environment = var.environment
}
