locals {
  availability_zones = toset(var.availability_zones)
}

resource "aws_rds_cluster_instance" "instance" {
  for_each = local.availability_zones

  cluster_identifier = var.cluster_id
  identifier         = "${var.project}-${var.environment_short}-az-${substr(each.value, -1, 1)}"

  engine         = var.engine_config.engine
  engine_version = "8.0.mysql_aurora.3.05.1"

  instance_class = var.instance_class

  publicly_accessible  = false
  availability_zone    = each.value
  db_subnet_group_name = var.db_subnet_group_name

  db_parameter_group_name = "default.aurora-mysql8.0"

  apply_immediately = false

  ca_cert_identifier = "rds-ca-2019"

  monitoring_interval = 60
  monitoring_role_arn = var.monitoring_role_arn

  promotion_tier = 0

  tags = {
    Project     = var.project
    Environment = var.environment
    Name        = "${var.project}_${var.environment_short}_az_${substr(each.value, -1, 1)}"
  }
}
