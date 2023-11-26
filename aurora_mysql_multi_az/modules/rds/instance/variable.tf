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

variable "cluster_id" {
  type = string
}

variable "engine_config" {
  type = object({
    engine = string
  })
}

variable "instance_class" {
  type = string
}

variable "db_subnet_group_name" {
  type = string
}

variable "monitoring_role_arn" {
  type = string
}
