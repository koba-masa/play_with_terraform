resource "aws_iam_role" "stopping_bastion_role" {
  name        = "${var.project}_${var.environment_short}_stopping_bastion"
  description = "For EventBridge to stop bastion server."

  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

  inline_policy {
    name = "stop_ec2_instance"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Effect   = "Allow"
          Action   = ["ec2:StopInstances"]
          Resource = var.bastion_arn
        },
      ]
    })
  }

  tags = {
    Project     = var.project
    Environment = var.environment
    Function    = "stopping_bastion"
    Name        = "${var.project}_${var.environment_short}_stopping_bastion"
  }
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = [
        "scheduler.amazonaws.com"
      ]
    }
    actions = ["sts:AssumeRole"]
  }
}