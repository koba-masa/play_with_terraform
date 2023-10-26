locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
  tags       = merge(var.common_tags, { Environment = var.environment })
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

module "detection_errors_from_cloudwatch_logs" {
  source                  = "./modules/cloudwatch"
  account_id              = local.account_id
  region                  = local.region
  log_group_name          = "/play_with_terraform/detection_errors_from_cloudwatch_logs"
  notification_lambda_arn = module.common.notification_lambda_arn
}

module "detection_errors_from_cloudwatch_logs_notification" {
  source     = "./modules/notification"
  topic_name = "detection_errors_from_cloudwatch_logs"
  tags   = local.tags
}

module "common" {
  source = "./modules/common"
  tags   = local.tags
}
