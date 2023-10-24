locals {
  tags = merge(var.common_tags, { Environment = var.environment })
}
