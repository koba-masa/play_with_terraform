variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}

variable "topic_name" {
  description = "SNS topic name"
  type        = string
}

variable "emails" {
  description = "List of emails to subscribe to the SNS topic"
  type        = list(string)
}
