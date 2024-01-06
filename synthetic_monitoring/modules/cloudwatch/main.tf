resource "aws_synthetics_canary" "synthetic_monitoring" {
  name = replace("pwt_${terraform.workspace}_${var.system_identifier}", "__", "_")

  runtime_version = "syn-python-selenium-2.0"
  handler         = "synthetic_monitoring.handler"
  zip_file        = data.archive_file.handler.output_path
  delete_lambda   = true
  start_canary    = true

  artifact_s3_location = replace("s3://${var.bucket_id}/${var.system_identifier}", "/_", "/")
  execution_role_arn   = var.role_arn

  schedule {
    expression = "rate(15 minutes)"
  }

  run_config {
    timeout_in_seconds = 120
    environment_variables = {
      HEALTHCHECK_URL = var.healthcheck_url
    }
  }

  tags = {
    Project     = var.project
    Environment = var.environment
    Function    = "synthetic_monitoring"
  }
}

data "archive_file" "handler" {
  type        = "zip"
  output_path = "../tmp/synthetic_monitoring.zip"
  source {
    filename = "python/synthetic_monitoring.py" # MEMO: python/〜.pyの構造になっていないといけない
    content  = file("${path.module}/synthetic_monitoring.py")
  }
}
