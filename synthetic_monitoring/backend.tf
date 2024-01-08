terraform {
  backend "s3" {
    bucket = "play-with-terraform"
    key    = "synthetic_monitoring.tfstate"
    region = "us-west-2"
  }
}
