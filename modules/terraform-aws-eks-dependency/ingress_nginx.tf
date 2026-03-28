resource "kubernetes_namespace" "ingress_nginx" {
  metadata {
    name = "ingress-nginx"
  }
}

resource "helm_release" "ingress_nginx" {
  name      = "ingress-nginx"
  namespace = kubernetes_namespace.ingress_nginx.metadata[0].name

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"

  # Equivalent to -f ./nginx-ingress.yaml
  values = [
    file("${path.module}/nginx-ingress/nginx-ingress.yaml")
  ]

  depends_on = [kubernetes_namespace.ingress_nginx]
}