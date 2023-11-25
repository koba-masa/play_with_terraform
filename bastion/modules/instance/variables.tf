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

variable "subnet_id" {
  type = string
}

variable "security_groups" {
  type = list(string)
}

variable "key_name" {
  type = string
}

variable "iam_instance_profile" {
  type = string
}
