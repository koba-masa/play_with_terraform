output "export" {
  value = {
    vpc_id             = data.terraform_remote_state.network.outputs.network.vpc_id
    vpc_cidr_block     = data.terraform_remote_state.network.outputs.network.vpc_cidr_block
    availability_zones = data.terraform_remote_state.network.outputs.network.availability_zones
    public_subnet_ids  = data.terraform_remote_state.network.outputs.network.public_subnet_ids

    bastion_security_group_id = data.terraform_remote_state.bastion.outputs.bastion.bastion_security_group_id
  }
}
