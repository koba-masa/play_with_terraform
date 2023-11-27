data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "play-with-terraform"
    key    = "network/production.tfstate"
    region = "us-west-2"
  }
}

data "terraform_remote_state" "bastion" {
  backend = "s3"

  config = {
    bucket = "play-with-terraform"
    key    = "bastion/production.tfstate"
    region = "us-west-2"
  }
}
