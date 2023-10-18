terraform {
  backend "s3" {
    bucket = "play-with-terraform"
    key    = "web_service_with_ecs/${var.environment}.tfstate"
    region = "us-west-2"
  }
}
