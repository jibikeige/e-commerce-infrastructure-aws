output "redis_endpoint" {
  value = aws_elasticache_replication_group.this.primary_endpoint_address
}

output "redis_reader_endpoint" {
  value = aws_elasticache_replication_group.this.reader_endpoint_address
}

output "redis_security_group_id" {
  value = aws_security_group.redis.id
}

output "redis_host" {
  value = aws_elasticache_replication_group.this.primary_endpoint_address
}

output "redis_port" {
  value = "6379"
}

output "redis_secret_arn" {
  value = aws_secretsmanager_secret.redis.arn
}

output "redis_secret_name" {
  value = aws_secretsmanager_secret.redis.name
}