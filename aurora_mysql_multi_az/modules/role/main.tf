resource "aws_iam_role" "rds_monitoring_role" {
  name        = "${var.project}_${var.environment_short}_rds_monitoring"
  description = "This role is used by RDS to send logs to CloudWatch."

  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole",
  ]

  tags = {
    Project     = var.project
    Environment = var.environment
    Identifier  = "rds_monitoring"
    Name        = "${var.project}_${var.environment_short}_rds_monitoring"
  }
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = [
        "monitoring.rds.amazonaws.com"
      ]
    }
    actions = ["sts:AssumeRole"]
  }
}
