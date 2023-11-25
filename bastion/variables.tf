variable "region" {
  type = string
}

variable "project" {
  type    = string
  default = "play-with-terraform"
}

variable "environment" {
  type = string
}

variable "environment_short" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}
