resource "aws_s3_bucket" "synthetic_monitoring_log" {
  bucket = replace("${var.project}-${terraform.workspace}-synthetic-monitoring", "_", "-")

  tags = {
    Project     = var.project
    Environment = var.environment
    Function    = "synthetic_monitoring"
  }
}
