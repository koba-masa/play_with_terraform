resource "aws_iam_policy" "policy" {
  name = "${var.project}_${terraform.workspace}_remote_state_verification"
  path = "/"

  policy = jsonencode(
    {
      Version   = "2012-10-17"
      Statement = [
        {
          Action = ["ec2:Describe*"]
          Effect   = "Allow"
          Resource = "*"
        }
      ]
    }
  )

  tags = {
    Project     = var.project
    Environment = var.environment
    Identifier  = "remote_state_verification"
  }
}
