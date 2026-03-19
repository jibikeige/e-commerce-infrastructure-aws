terraform {
  backend "s3" {
    bucket  = "jibike-teleios-state-file"
    region  = "us-east-1"
    encrypt = true
  }
}