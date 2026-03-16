data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "jibike-teleios-state-file"
    key    = "env:/${terraform.workspace}/vpc/terraform.tfstate"  # dynamically pick workspace
    region = "us-east-1"

    # optional locking
    # dynamodb_table = "terraform-locks"
    # encrypt        = true
  }
}