module "common_user" {
  source      = "./modules/user"
  project     = "play_with_terraform"
  environment = "common"
  user_name   = "remote_state_verification"
}
