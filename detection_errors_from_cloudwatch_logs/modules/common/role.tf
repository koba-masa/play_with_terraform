resource "aws_iam_role" "notification_lambda_execution_role" {
  name        = "play_with_terraform_deteciotn_errors_from_cloudwatch_logs"
  description = "Notification Lambda execution role"

  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
  ]
  tags = var.tags
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = [
        "lambda.amazonaws.com"
      ]
    }
    actions = ["sts:AssumeRole"]
  }
}
