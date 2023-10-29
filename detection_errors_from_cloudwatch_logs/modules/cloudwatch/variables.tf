variable "log_group_name" {
  description = "Target log gourp name"
  type        = string
}

variable "notification_lambda_arn" {
  description = "Lambda ARN to send error message"
  type        = string
}

variable "account_id" {
  description = ""
  type        = string
}

variable "region" {
  description = ""
  type        = string
}
