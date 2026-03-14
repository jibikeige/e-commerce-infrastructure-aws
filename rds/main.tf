locals {
  db_credentials = jsondecode(data.aws_secretsmanager_secret_version.db.secret_string)
}

module "rds" {
  source = "../modules/terraform-aws-eks" # path to your module

  region      = var.region
  name        = var.name
  environment = var.environment

  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
  private_subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids

  db_name  = "teleios"
  username = var.username
  db_password = local.db_credentials.password

  instance_class = var.db_instance_class
  allocated_storage = var.db_storage

  multi_az = var.db_multi_az

  backup_retention_period = var.backup_retention

  depends_on = [
    aws_secretsmanager_secret_version.db
  ]
}