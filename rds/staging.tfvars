region      = "us-east-2"
name        = "teleios-jibike-staging-rds"
environment = "staging"

username          = "postgres"
db_instance_class = "db.t3.micro"

db_multi_az             = false
allocated_storage       = "20"
backup_retention_period = 3