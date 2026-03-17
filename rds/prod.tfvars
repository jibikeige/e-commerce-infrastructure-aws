region      = "us-east-2"
name        = "teleios-jibike-prod-rds"
environment = "prod"

username          = "postgres"
db_instance_class = "db.t3.micro"

db_multi_az             = true
allocated_storage       = "20"
backup_retention_period = 3