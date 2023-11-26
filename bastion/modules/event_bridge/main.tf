resource "aws_scheduler_schedule" "stopping_bastion" {
  name        = "${var.project}_${var.environment_short}_stopping_bastion"
  description = "Stop bastion server on ${var.environment} at every 20:00."

  group_name = "default"

  schedule_expression_timezone = "Asia/Tokyo"
  schedule_expression          = "cron(0 0,3,15 * * ? *)"
  flexible_time_window {
    mode = "OFF"
  }

  target {
    arn      = "arn:aws:scheduler:::aws-sdk:ec2:stopInstances"
    role_arn = var.role_arn
    input = jsonencode({
      "InstanceIds" : [
        var.bastion_id
      ]
    })
    retry_policy {
      maximum_retry_attempts = 0
    }
  }
}
