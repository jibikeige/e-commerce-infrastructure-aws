resource "helm_release" "external_dns" {
  name       = "external-dns"
  namespace  = "kube-system"
  repository = "https://kubernetes-sigs.github.io/external-dns/"
  chart      = "external-dns"

  values = [
    yamlencode({
      provider = "aws"

      serviceAccount = {
        create = true
        name   = "external-dns"
        annotations = {
          "eks.amazonaws.com/role-arn" = aws_iam_role.external_dns.arn
        }
      }

      domainFilters = ["yourdomain.com"]

      policy = "sync"
      registry = "txt"
      txtOwnerId = var.name
    })
  ]

  depends_on = [module.eks]
}