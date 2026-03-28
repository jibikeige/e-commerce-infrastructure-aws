locals {
  oidc_provider     = replace(var.aws_eks_cluster_identity, "https://", "")
  oidc_provider_url = local.oidc_provider
  oidc_provider_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${local.oidc_provider}"
}