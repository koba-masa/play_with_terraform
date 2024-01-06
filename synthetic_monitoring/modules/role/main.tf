resource "aws_iam_role" "synthetic_monitoring" {
  name        = replace("${var.project}_${terraform.workspace}_synthetic_monitoring", "__", "_")
  description = "This Role is used by CloudWatch Synthetic."

  assume_role_policy = data.aws_iam_policy_document.assume_role_for_lambda.json
  # managed_policy_arns = [
  #   "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
  # ]

  tags = {
    Project     = var.project
    Environment = var.environment
    Function    = "synthetic_monitoring"
  }
}

data "aws_iam_policy_document" "assume_role_for_lambda" {
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
