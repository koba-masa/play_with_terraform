# resource "aws_cloudwatch_metric_alarm" "synthetic_monitoring" {
#   alarm_name = replace("pwt_${terraform.workspace}_${var.system_identifier}", "__", "_")
#   alarm_description = replace("pwt_${terraform.workspace}_${var.system_identifier}", "__", "_")

#   comparison_operator
#   evaluation_periods
#   metric_name
#   namespace
#   period
#   statistic
#   threshold
#   threshold_metric_id
#   actions_enabled
#   alarm_actions

#   datapoints_to_alarm
#   dimensions
#   insufficient_data_actions
#   ok_actions
#   unit
#   extended_statistic
#   treat_missing_data
#   evaluate_low_sample_count_percentiles
#   metric_query

#   tags = {
#     Project     = var.project
#     Environment = var.environment
#     Function    = "synthetic_monitoring"
#   }
# }
