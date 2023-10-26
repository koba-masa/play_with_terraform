variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}

variable "topic_name" {
  description = "SNS topic name"
  type        = string
}
