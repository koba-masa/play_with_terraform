locals {
  tags = merge(var.common_tags, { Environment = var.environment })
}

module "ecr" {
  source = "./modules/ecr"
  tags   = local.tags
}
