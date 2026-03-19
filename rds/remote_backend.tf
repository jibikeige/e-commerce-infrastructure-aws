data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "jibike-teleios-state-file"
    key    = "vpc/${var.environment}.tfstate"
    region = "us-east-1"
  }
}