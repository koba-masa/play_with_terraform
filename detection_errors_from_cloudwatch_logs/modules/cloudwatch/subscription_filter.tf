resource "aws_cloudwatch_log_subscription_filter" "detection_errors_from_cloudwatch_logs" {
  name            = "detection_errors_from_cloudwatch_logs"
  log_group_name  = var.log_group_name
  destination_arn = var.notification_lambda_arn
  filter_pattern  = "%ERROR%"
}

resource "aws_lambda_permission" "log_permission" {
  function_name = "detection_errors_from_cloudwatch_logs"
  action        = "lambda:InvokeFunction"
  principal     = "logs.${var.region}.amazonaws.com"
  source_arn    = "arn:aws:logs:${var.region}:${var.account_id}:log-group:${var.log_group_name}:*"
}
