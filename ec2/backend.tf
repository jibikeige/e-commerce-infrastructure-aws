terraform {
  backend "s3" {
    bucket  = "jibike-teleios-state-file"
    key     = "ec2/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}