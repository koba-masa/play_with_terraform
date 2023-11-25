resource "aws_rds_cluster" "example" {
  # エンジンのタイプ
  engine                    = "aurora-mysql"
  engine_mode = ""
  engine_version = "8.0.mysql_aurora.3.05.1"

  # 設定
  cluster_identifier        = "${var.project}_${var.environment_short}"

  master_username           = "adm1n1strator"
  master_password           = var.master_password
  # manage_master_user_password

  # io1  :
  # iops :
  storage_type              = "io1"

  # クラスターストレージ設定

  # インスタンスの設定
  db_cluster_instance_class = "db.t3.medium"

  # 可用性と耐久性

  # 接続
  network_type = "IPV4"
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = [var.security_group_id]
  port = 3306

  # リードレプリカの書き込み転送

  # データベース認証
  iam_database_authentication_enabled = false

  # モニタリング


  # 追加設定
  ## データベースの選択肢
  # database_name = ""
  db_cluster_parameter_group_name = "default.aurora-mysql8.0"
  db_instance_parameter_group_name = "default.aurora-mysql8.0"
  ### フェイルオーバー優先順位
  ## バックアップ
  backup_retention_period = 1
  copy_tags_to_snapshot = true
  ## 暗号化

  ## バックトラック
  # backtrack_window
  ## ログのエクスポート
  enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
  ## メンテナンス
  allow_major_version_upgrade = true
  preferred_maintenance_window = "sun:05:00-sun:05:30" # UTC
  ## 削除保護
  deletion_protection = false


  # OTHER
  availability_zones        = var.availability_zones









  allocated_storage         = 100
  iops                      = 1000




  allocated_storage

  apply_immediately
  availability_zones


  cluster_identifier_prefix
  cluster_identifier


  db_cluster_instance_class


  db_system_id
  delete_automated_backups
  deletion_protection
  enable_global_write_forwarding
  enable_http_endpoint


  final_snapshot_identifier
  global_cluster_identifier
  iam_roles
  iops



  preferred_backup_window

  replication_source_identifier
  restore_to_point_in_time
  scaling_configuration
  serverlessv2_scaling_configuration
  skip_final_snapshot
  snapshot_identifier
  source_region
  storage_encrypted
  storage_type



  tags = {
    Project     = var.project
    Environment = var.environment
    Identifier  = "database"
    Name        = "${var.project}_${var.environment_short}_database_private_az_${substr(each.value, -1, 1)}"
  }
}
