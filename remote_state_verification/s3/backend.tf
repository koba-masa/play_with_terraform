terraform {
  backend "s3" {
    bucket = "play-with-terraform"
    key    = "remote_state_verification/s3.tfstate"
    region = "us-west-2"
  }
}
