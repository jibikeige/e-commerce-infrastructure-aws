locals {
  services = ["trip-service"]

  db_secret_name    = data.terraform_remote_state.rds.outputs.db_secret_name
  redis_secret_name = data.terraform_remote_state.redis.outputs.redis_secret_name

  manifests = {
    for svc in local.services : svc => {
      deployment = yamldecode(file("${path.module}/../modules/services/${svc}/deployment.yaml"))
      service    = yamldecode(file("${path.module}/../modules/services/${svc}/service.yaml"))
      hpa        = yamldecode(file("${path.module}/../modules/services/${svc}/hpa.yaml"))
    }
  }
}

module "applications" {
  source = "../modules/application"

  region                   = var.region
  environment              = var.environment
  namespace                = "rideshare-prod"
  aws_eks_cluster_identity = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
  cluster_name             = data.aws_eks_cluster.this.name
  cluster_endpoint         = data.aws_eks_cluster.this.endpoint

  manifests  = local.manifests

  db_secret_name    = local.db_secret_name
  redis_secret_name = local.redis_secret_name
  app_secret_name = "jibike-rideshare"
}