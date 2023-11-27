output "network" {
  value = {
    vpc_id         = module.vpc.id
    vpc_cidr_block = module.vpc.cidr_block

    availability_zones = split(",", var.availability_zones)

    public_subnet_ids = module.subnet.public_ids
  }
}
