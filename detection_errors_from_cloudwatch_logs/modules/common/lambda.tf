data "archive_file" "lambda" {
  type        = "zip"
  source_file = "../src/detection_errors_from_cloudwatch_logs.py"
  output_path = "../src/lambda_function_payload.zip"
}

resource "aws_lambda_function" "notification_lambda" {
  function_name = "detection_errors_from_cloudwatch_logs"
  description   = "This function calls notification."
  runtime       = "python3.11"
  handler       = "detection_errors_from_cloudwatch_logs.lambda_handler"
  architectures = ["x86_64"]
  role          = aws_iam_role.notification_lambda_execution_role.arn

  filename         = "../src/lambda_function_payload.zip"
  source_code_hash = data.archive_file.lambda.output_base64sha256

  memory_size = 128
  ephemeral_storage {
    size = 512
  }
  timeout = 3

  environment {
    variables = {
      SNS_TOPIC_ARN = var.sns_topic_arn
    }
  }

  tags = var.tags
}
