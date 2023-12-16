resource "aws_iam_policy" "policy" {
  name = "${var.project}_${terraform.workspace}_remote_state_verification"
  path = "/"

  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        {
          Action   = [
            "s3:ListBucket",
            "GetObject",
          ]
          Effect   = "Allow"
          Resource = [
            "${var.s3_bucket_arn}",
            "${var.s3_bucket_arn}/*",
          ]
        },
      ],
    }
  )

  tags = {
    Project     = var.project
    Environment = var.environment
    Identifier  = "remote_state_verification"
  }
}

resource "aws_iam_user_policy_attachment" "policy_attach" {
  user       = var.user_name
  policy_arn = aws_iam_policy.policy.arn
}
