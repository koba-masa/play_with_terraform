terraform {
  backend "s3" {
    bucket = "play-with-terraform"
    key    = "deteciotn_errors_form_cloudwatch_logs/production.tfstate"
    region = "us-west-2"
  }
}
