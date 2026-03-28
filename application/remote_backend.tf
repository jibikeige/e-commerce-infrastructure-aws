data "terraform_remote_state" "rds" {
  backend = "s3"

  config = {
    bucket = "jibike-teleios-state-file"
    key    = "rds/${var.environment}.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "redis" {
  backend = "s3"

  config = {
    bucket = "jibike-teleios-state-file"
    key    = "redis/${var.environment}.tfstate"
    region = "us-east-1"
  }
}