output "export" {
  value = {
    users = {
      common_user_name = data.terraform_remote_state.user.outputs.common_user_name
    }

    buckets = {
      s3_bucket_arn = data.terraform_remote_state.s3_bucket.outputs.s3_bucket_arn
    }
  }
}
