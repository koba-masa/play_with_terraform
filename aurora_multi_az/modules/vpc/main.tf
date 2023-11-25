# Terraform にて　VPCを構築するためのコードを書いてください
resource "aws_vpc" "vpc" {
  cidr_block                       = var.cidr_block
  assign_generated_ipv6_cidr_block = false

  instance_tenancy = "default"

  enable_dns_support                   = true
  enable_dns_hostnames                 = false
  enable_network_address_usage_metrics = false

  tags = {
    Project     = var.project
    Environment = var.environment
    Name        = "${var.project}_${var.environment_short}"
  }
}
