variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "environment_short" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "db_subnet_group_name" {
  type = string
}

variable "master_password" {
  type = string
}

variable "security_group_id" {
  type = string
}
