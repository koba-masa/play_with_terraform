data "terraform_remote_state" "user" {
  backend = "s3"

  config = {
    bucket = "play-with-terraform"
    key    = "remote_state_verification/user.tfstate"
    region = "us-west-2"
  }

  # ワークスペースを切ったリソースはworkspaeを指定しない
}

data "terraform_remote_state" "s3_bucket" {
  backend = "s3"

  config = {
    bucket = "play-with-terraform"
    key    = "remote_state_verification/s3.tfstate"
    region = "us-west-2"
  }

  workspace = terraform.workspace # ワークスペースを切ったリソースはこの項目を指定する
}
