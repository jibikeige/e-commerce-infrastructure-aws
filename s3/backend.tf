terraform {
  backend "s3" {
    bucket  = "jibike-teleios-state-file"
    key     = "s3/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}