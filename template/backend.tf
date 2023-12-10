terraform {
  backend "s3" {
    bucket = "play-with-terraform"
    key    = "template.tfstate"
    region = "us-west-2"
  }
}
