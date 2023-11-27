resource "aws_rds_cluster" "cluster" {
  # エンジンのタイプ
  engine         = "aurora-mysql"
  engine_mode    = "provisioned"
  engine_version = "8.0.mysql_aurora.3.05.1"

  # 設定
  cluster_identifier = "${var.project}-${var.environment_short}"

  master_username = "adm1n1strator"
  master_password = var.master_password
  #master_password = random_password.master_password.result
  # manage_master_user_password

  # クラスターストレージ設定

  # 可用性と耐久性

  # 接続
  network_type           = "IPV4"
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = [var.security_group_id]
  port                   = 3306

  # リードレプリカの書き込み転送

  # データベース認証
  iam_database_authentication_enabled = false

  # 追加設定
  ## データベースの選択肢
  database_name                    = null
  db_cluster_parameter_group_name  = "default.aurora-mysql8.0"
  db_instance_parameter_group_name = "default.aurora-mysql8.0"
  ### フェイルオーバー優先順位
  ## バックアップ
  backup_retention_period = 1
  preferred_backup_window = "00:00-00:30" # UTC
  copy_tags_to_snapshot   = true
  ## 暗号化
  storage_encrypted = true

  ## バックトラック
  # backtrack_window
  ## ログのエクスポート
  enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
  ## メンテナンス
  allow_major_version_upgrade  = true
  preferred_maintenance_window = "sun:20:00-sun:20:30" # UTC
  ## 削除保護
  deletion_protection = false

  # OTHER
  availability_zones       = var.availability_zones
  apply_immediately        = false
  delete_automated_backups = false
  skip_final_snapshot      = true # falseの場合は、どうすればよいのか？

  # db_system_id
  # enable_global_write_forwarding
  # enable_http_endpoint
  # final_snapshot_identifier
  # global_cluster_identifier
  # iam_roles
  # replication_source_identifier
  # restore_to_point_in_time
  # scaling_configuration
  # snapshot_identifier

  tags = {
    Project     = var.project
    Environment = var.environment
    Name        = "${var.project}_${var.environment_short}"
  }
}

# resource "random_password" "master_password" {
#   length  = 25
#   special = false
# }
