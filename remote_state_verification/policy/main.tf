module "policy_for_common_user" {
  source        = "./modules/policy"
  project       = var.project
  environment   = var.environment
  s3_bucket_arn = data.terraform_remote_state.remote_state.outputs.export.buckets.s3_bucket_arn
  user_name     = data.terraform_remote_state.remote_state.outputs.export.users.common_user_name
}
