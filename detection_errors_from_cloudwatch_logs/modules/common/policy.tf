resource "aws_iam_policy" "deteciotn_errors_from_cloudwatch_logs_policy" {
  name        = "play_with_terraform_deteciotn_errors_from_cloudwatch_logs"
  description = "Notification Lambda execution policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "sns:Publish",
        ]
        Resource = [
          var.sns_topic_arn,
        ]
      },
    ]
  })

  tags = var.tags
}
