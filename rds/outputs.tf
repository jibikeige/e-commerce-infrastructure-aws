// outputs.tf in the parent module (root)
output "db_secret_name" {
  value = module.rds.db_secret_name
}

output "db_secret_arn" {
  value = module.rds.db_secret_arn
}