resource "aws_iam_user" "user" {
  name = var.user_name
  path = "/"

  tags = {
    Project     = var.project
    Environment = var.environment
    Identifier  = "remote_state_verification"
  }
}
