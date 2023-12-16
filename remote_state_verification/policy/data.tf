data "terraform_remote_state" "remote_state" {
  backend = "s3"

  config = {
    bucket = "play-with-terraform"
    key    = "remote_state_verification/remote_state.tfstate"
    region = "us-west-2"
  }

  workspace = terraform.workspace
}
