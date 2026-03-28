output "db_host" {
  value = aws_db_instance.this.address
}

output "db_port" {
  value = tostring(aws_db_instance.this.port)
}

output "db_name" {
  value = aws_db_instance.this.db_name
}

output "db_username" {
  value = aws_db_instance.this.username
}

output "db_secret_arn" {
  value = aws_secretsmanager_secret.db.arn
}

output "db_secret_name" {
  value = aws_secretsmanager_secret.db.name
}