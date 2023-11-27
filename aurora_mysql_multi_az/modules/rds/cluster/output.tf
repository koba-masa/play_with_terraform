output "id" {
  value = aws_rds_cluster.cluster.id
}

output "engine_config" {
  value = {
    engine = aws_rds_cluster.cluster.engine
  }
}
