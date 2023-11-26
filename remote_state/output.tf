output "export" {
  value = {
    vpc_id            = data.terraform_remote_state.network.outputs.network.vpc_id
    public_subnet_ids = data.terraform_remote_state.network.outputs.network.public_subnet_ids

    bastion_security_group_id = data.terraform_remote_state.bastion.outputs.bastion.bastion_security_group_id
  }
}
