module "vpc" {
  source = "../modules/terraform-aws-vpc" # path to your module

  vpc_cidr        = var.vpc_cidr
  name            = var.name
  environment     = var.environment
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
  region          = var.region
}