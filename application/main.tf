module "applications" {
  source = "../modules/application"
  region = var.region
  environment = var.environment
  aws_eks_cluster_identity = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
  cluster_name             = data.aws_eks_cluster.this.name
  cluster_endpoint         = data.aws_eks_cluster.this.endpoint

  services = [
    "trip-service"
  ]

  base_path = "${path.module}/services"
}