locals {
  availability_zones = toset(var.availability_zones)
}

resource "aws_db_subnet_group" "subnet_group_for_db" {
  name        = "${var.project}_${var.environment_short}_database"
  description = "This subnet group is used by database."

  subnet_ids = values(aws_subnet.private)[*].id

  tags = {
    Project     = var.project
    Environment = var.environment
    Identifier  = "database"
    Name        = "${var.project}_${var.environment_short}_database"
  }
}

resource "aws_subnet" "private" {
  for_each = local.availability_zones

  vpc_id     = var.vpc_id
  cidr_block = cidrsubnet(var.cidr_block, 8, index(var.availability_zones, each.value) + 1)


  availability_zone = each.value
  enable_dns64      = false

  map_public_ip_on_launch = false

  private_dns_hostname_type_on_launch = "ip-name"

  tags = {
    Project     = var.project
    Environment = var.environment
    Identifier  = "database"
    Name        = "${var.project}_${var.environment_short}_database_private_az_${substr(each.value, -1, 1)}"
  }
}
