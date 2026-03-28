locals {
  services = ["trip-service", "driver-service", "email-service", "matching-service", "rider-service", "frontend"]

  db_secret_name    = data.terraform_remote_state.rds.outputs.db_secret_name
  redis_secret_name = data.terraform_remote_state.redis.outputs.redis_secret_name

  manifests = {
    for svc in local.services : svc => {
      deployment = yamldecode(file("${path.module}/../modules/services/${svc}/deployment.yaml"))
      service    = yamldecode(file("${path.module}/../modules/services/${svc}/service.yaml"))
      hpa        = yamldecode(file("${path.module}/../modules/services/${svc}/hpa.yaml"))
      configmap  = try(yamldecode(file("${path.module}/../modules/services/${svc}/configmap.yaml")), null)
      ingress    = try(yamldecode(file("${path.module}/../modules/services/${svc}/ingress.yaml")), null)
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

  manifests = local.manifests

  db_secret_name    = local.db_secret_name
  redis_secret_name = local.redis_secret_name
  app_secret_name   = "jibike-rideshare"
  dns_name          = var.dns_name

  paths = [
    {
      path     = "/api/v1/drivers"
      pathType = "Prefix"
      backend  = { service = { name = "rideshare-driver", port = { number = 3003 } } }
    },
    {
      path     = "/api/v1/riders"
      pathType = "Prefix"
      backend  = { service = { name = "rideshare-service", port = { number = 3000 } } }
    },
    {
      path     = "/api/fares"
      pathType = "Prefix"
      backend  = { service = { name = "rideshare-service", port = { number = 3003 } } }
    },
    {
      path     = "/drivers"
      pathType = "Prefix"
      backend  = { service = { name = "matching-service", port = { number = 3004 } } }
    },
    {
      path     = "/api/v1/trips"
      pathType = "Prefix"
      backend  = { service = { name = "trip-service", port = { number = 3006 } } }
    },
    {
      path     = "/api/v1/fare"
      pathType = "Prefix"
      backend  = { service = { name = "trip-service", port = { number = 3006 } } }
    },
    {
      path     = "/api/v1/analytic"
      pathType = "Prefix"
      backend  = { service = { name = "trip-service", port = { number = 3006 } } }
    },
    {
      path     = "/api/health"
      pathType = "Prefix"
      backend  = { service = { name = "trip-service", port = { number = 3006 } } }
    },
    {
      path     = "/"
      pathType = "Prefix"
      backend  = { service = { name = "frontend", port = { number = 80 } } }
    },
  ]

}