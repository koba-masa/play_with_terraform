resource "aws_sns_topic" "email_notification" {
  name = var.topic_name
  tags = var.tags
}

resource "aws_sns_topic_subscription" "email_subscription" {
  for_each  = toset(var.emails)
  topic_arn = aws_sns_topic.email_notification.arn
  protocol  = "email"
  endpoint  = each.key
}
