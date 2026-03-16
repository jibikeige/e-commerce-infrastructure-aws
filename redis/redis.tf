module "redis" {

  source = "../modules/terraform-aws-redis"

  region      = var.region
  name        = var.name
  environment = var.environment

  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids

  node_type       = var.redis_node_type
  num_cache_nodes = var.redis_nodes

  engine_version = var.engine_version

  automatic_failover_enabled = var.automatic_failover_enabled
  multi_az_enabled           = var.multi_az_enabled

  allowed_ingress_cidr = [
    data.terraform_remote_state.vpc.outputs.vpc_cidr
  ]
}