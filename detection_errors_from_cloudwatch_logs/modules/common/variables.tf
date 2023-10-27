variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}

variable "sns_topic_arn" {
  description = "SNS Topic ARN"
  type        = string
}
