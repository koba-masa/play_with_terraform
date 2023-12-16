resource "aws_s3_bucket" "bucket" {
  bucket = "${var.project}-${terraform.workspace}-remote-state-verification"

  tags = {
    Project     = var.project
    Environment = var.environment
    Identifier  = "remote_state_verification"
  }
}
