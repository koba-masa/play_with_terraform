output "bastion" {
  value = {
    bastion_security_group_id = module.security_group.id
  }
}
