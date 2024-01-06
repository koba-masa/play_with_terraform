resource "aws_iam_policy" "synthetic_monitoring" {
  name        = replace("${var.project}_${terraform.workspace}_synthetic_monitoring", "__", "_")
  description = "This policy is used for synthetic monitoring."
  path        = "/"

  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow",
          Action = [
            "s3:PutObject",
            "s3:GetObject"
          ],
          Resource = [
            replace("arn:aws:s3:::${var.bucket_id}/*", "/_", "/")
          ]
        },
        {
          Effect = "Allow",
          Action = [
            "s3:GetBucketLocation"
          ],
          Resource = [
            "arn:aws:s3:::${var.bucket_id}"
          ]
        },
        {
          Effect = "Allow",
          Action = [
            "logs:CreateLogStream",
            "logs:PutLogEvents",
            "logs:CreateLogGroup"
          ],
          Resource = [
            replace("arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/cwsyn-*-*", "__", "_"),
          ]
        },
        {
          Effect = "Allow",
          Action = [
            "s3:ListAllMyBuckets",
            "xray:PutTraceSegments"
          ],
          Resource = [
            "*"
          ]
        },
        {
          Effect   = "Allow",
          Resource = "*",
          Action   = "cloudwatch:PutMetricData",
          Condition = {
            StringEquals = {
              "cloudwatch:namespace" = "CloudWatchSynthetics"
            }
          }
        }
      ]
    }
  )

  tags = {
    Project     = var.project
    Environment = var.environment
    Function    = "synthetic_monitoring"
  }
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = var.role_name
  policy_arn = aws_iam_policy.synthetic_monitoring.arn
}

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
