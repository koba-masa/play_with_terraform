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

module "policy" {
  source      = "./modules/policy"
  project     = var.project
  environment = var.environment
  bucket_id   = module.bucket.id
  role_name   = module.role.name
}
