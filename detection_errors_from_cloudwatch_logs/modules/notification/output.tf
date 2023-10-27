output "sns_topic_arn" {
  description = "The ARN of SNS topic"
  value       = aws_sns_topic.email_notification.arn
}
