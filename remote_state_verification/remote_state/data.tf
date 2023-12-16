data "terraform_remote_state" "user" {
  backend = "s3"

  config = {
    bucket = "play-with-terraform"
    key    = "remote_state_verification/user.tfstate"
    region = "us-west-2"
  }
}
