module "eks-dependency" {
  source = "../modules/terraform-aws-eks-dependency" # path to your module

  environment              = var.environment
  role_name                = var.role_name
  name                     = var.name
  region                   = var.region
  aws_eks_cluster_identity = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
  cluster_name             = data.aws_eks_cluster.this.name
  cluster_endpoint         = data.aws_eks_cluster.this.endpoint
  domain_name              = "jibike.rideshare.lukmonadeokun.com"
}