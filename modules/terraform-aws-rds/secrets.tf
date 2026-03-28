resource "random_password" "db" {
  length           = 20
  special          = true
  override_special = "!#$%^&*()-_=+[]{}<>:?"
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_secretsmanager_secret" "db" {
  name = "${var.name}-postgres-credentials-${random_id.suffix.hex}/db-credentials"

  recovery_window_in_days = 0

  tags = {
    Name        = "${var.name}-db-secret"
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "db" {
  secret_id = aws_secretsmanager_secret.db.id

  secret_string = jsonencode({
    host     = aws_db_instance.this.address
    port     = tostring(aws_db_instance.this.port)
    db       = aws_db_instance.this.db_name
    username = aws_db_instance.this.username
    password = random_password.db.result
    url      = "postgresql://${aws_db_instance.this.username}:${random_password.db.result}@${aws_db_instance.this.address}:${aws_db_instance.this.port}/${aws_db_instance.this.db_name}"
  })
}