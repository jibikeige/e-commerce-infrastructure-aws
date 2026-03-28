locals {
  services = ["trip-service"]

  manifests = {
    for svc in local.services : svc => {
      deployment = yamldecode(file("${path.root}/services/${svc}/deployment.yaml"))
      service    = yamldecode(file("${path.root}/services/${svc}/service.yaml"))
      hpa        = yamldecode(file("${path.root}/services/${svc}/hpa.yaml"))
    }
  }
}

module "applications" {
  source = "../modules/application"

  region                   = var.region
  environment              = var.environment
  aws_eks_cluster_identity = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
  cluster_name             = data.aws_eks_cluster.this.name
  cluster_endpoint         = data.aws_eks_cluster.this.endpoint

  manifests = local.manifests
}