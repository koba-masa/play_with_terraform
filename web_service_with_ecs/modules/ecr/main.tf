variable "tags" {
  description = "Tags for ECR Repository"
  type        = map(string)
  default     = {}
}

resource "aws_ecr_repository" "play_with_terraform_web_service_with_ecs" {
  name                 = "play_with_tf_web_service_with_ecs"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }

  tags = var.tags
}
