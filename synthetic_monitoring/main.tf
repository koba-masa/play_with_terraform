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

module "synthetic_monitoring" {
  source            = "./modules/cloudwatch"
  project           = var.project
  environment       = var.environment
  system_identifier = var.system_identifier
  bucket_id         = module.bucket.id
  role_arn          = module.role.arn
  healthcheck_url   = var.healthcheck_url
}
