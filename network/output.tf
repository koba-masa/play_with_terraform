output "network" {
  value = {
    vpc_id            = module.vpc.id
    public_subnet_ids = module.subnet.public_ids
  }
}
