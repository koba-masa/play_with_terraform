variable "aws_region" {
  description = "AWSリージョン"
  type        = string
}

variable "common_tags" {
  description = "共通タグ"
  type        = map(string)
  default = {
    Project        = "play_with_terraform"
    Identifier     = "web_service_with_ecs"
    CmBillingGroup = "play_with_tf_web_service_with_ecs"
  }
}

variable "environment" {
  description = "環境"
  type        = string
}
