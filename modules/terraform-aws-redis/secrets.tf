resource "random_password" "redis" {
  length  = 32
  special = false
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_secretsmanager_secret" "redis" {
  name                    = "${var.name}/redis-${random_id.suffix.hex}"
  recovery_window_in_days = 0

  tags = {
    Name        = "${var.name}-redis-secret"
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "redis" {
  secret_id = aws_secretsmanager_secret.redis.id

  secret_string = jsonencode({
    host     = aws_elasticache_replication_group.this.primary_endpoint_address
    port     = "6379"
    password = random_password.redis.result
    url      = "rediss://:${random_password.redis.result}@${aws_elasticache_replication_group.this.primary_endpoint_address}:6379"
  })
}