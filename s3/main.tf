module "s3" {

  source = "./modules/terraform-aws-s3"

  region = var.region

  bucket_name = var.bucket_name
  environment = var.environment

  versioning_enabled = var.versioning_enabled
  lifecycle_enabled  = var.lifecycle_enabled
  transition_days    = var.transition_days
}