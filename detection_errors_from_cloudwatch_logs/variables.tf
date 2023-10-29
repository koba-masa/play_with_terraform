variable "aws_region" {
  description = "AWSリージョン"
  type        = string
}

variable "common_tags" {
  description = "共通タグ"
  type        = map(string)
  default = {
    Project        = "play_with_terraform"
    Identifier     = "detection_errors_from_cloudwatch_logs"
    CmBillingGroup = "play_with_tf_detection_errors_from_cloudwatch_logs"
  }
}

variable "environment" {
  description = "環境"
  type        = string
}
