resource "aws_iam_user" "user" {
  name = replace("${var.project}_${var.environment}_${var.identifier}_state_creation_verification", "__", "_")
  path = "/"

  tags = {
    Project     = var.project
    Environment = var.environment
    Identifier  = var.identifier
    Function    = "state_creation_verification"
  }
}
