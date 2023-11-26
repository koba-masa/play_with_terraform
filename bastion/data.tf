data "terraform_remote_state" "remote_state" {
  backend = "s3"

  config = {
    bucket = "play-with-terraform"
    key    = "remote_state/production.tfstate"
    region = "us-west-2"
  }
}
