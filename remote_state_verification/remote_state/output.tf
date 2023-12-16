output "export" {
  value = {
    users = {
      common_user_name = data.terraform_remote_state.user.outputs.common_user_name
    }
  }
}
