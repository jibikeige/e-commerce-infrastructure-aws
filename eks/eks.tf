module "eks" {
  source          = "../modules/terraform-aws-eks" # path to your module
  name            = var.name
  region = var.region
  node_name       = var.node_name
  role_name       = var.role_name
  environment     = var.environment
  public_subnets  = data.terraform_remote_state.vpc.outputs.public_subnet_ids
  private_subnets = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  desired_nodes   = var.desired_nodes
  min_nodes       = var.min_nodes
  max_nodes       = var.max_nodes
  instance_types  = var.instance_types

}