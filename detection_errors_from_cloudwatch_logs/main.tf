locals {
  tags = merge(var.common_tags, { Environment = var.environment })
}

module "common" {
  source = "./modules/common"
  tags   = local.tags
}
