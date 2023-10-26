resource "aws_sns_topic" "email_notification" {
  name = var.topic_name
  tags = var.tags
}
