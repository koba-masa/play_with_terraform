terraform {
  backend "s3" {
    bucket = "play-with-terraform"
    key    = "cloudflare_dns_record.tfstate"
    region = "us-west-2"
  }
}
