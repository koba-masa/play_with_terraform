terraform {
  backend "s3" {
    bucket = "play-with-terraform"
    key    = "remote_state_verification/policy.tfstate"
    region = "us-west-2"
  }
}
