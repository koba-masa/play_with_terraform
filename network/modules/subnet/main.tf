# locals {
#   availability_zones = toset(var.availability_zones)
# }

resource "aws_subnet" "public" {
  # 節約のために、1つしか作成しない
  for_each = toset([var.availability_zones[0]])
  #for_each = local.availability_zones

  vpc_id     = var.vpc_id
  cidr_block = cidrsubnet(var.cidr_block, 8, index(var.availability_zones, each.value) + 1)

  availability_zone = each.value
  enable_dns64      = false

  map_public_ip_on_launch = true

  private_dns_hostname_type_on_launch = "ip-name"

  tags = {
    Project     = var.project
    Environment = var.environment
    Name        = "${var.project}_${var.environment_short}_public_az_${substr(each.value, -1, 1)}"
  }
}

resource "aws_subnet" "private" {
  # 節約のために、1つしか作成しない
  for_each = toset([var.availability_zones[0]])
  #for_each = local.availability_zones

  vpc_id     = var.vpc_id
  cidr_block = cidrsubnet(var.cidr_block, 8, index(var.availability_zones, each.value) + 1 + length(var.availability_zones))

  availability_zone = each.value
  enable_dns64      = false

  map_public_ip_on_launch = false

  private_dns_hostname_type_on_launch = "ip-name"

  tags = {
    Project     = var.project
    Environment = var.environment
    Name        = "${var.project}_${var.environment_short}_private_az_${substr(each.value, -1, 1)}"
  }
}
