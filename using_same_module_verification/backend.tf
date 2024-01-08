terraform {
  backend "s3" {
    bucket = "play-with-terraform"
    key    = "using_same_module_verification.tfstate"
    region = "us-west-2"
  }
}
