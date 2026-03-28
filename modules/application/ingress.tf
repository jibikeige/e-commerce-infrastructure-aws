resource "kubectl_manifest" "ingress" {
  yaml_body = yamlencode({
    apiVersion = "networking.k8s.io/v1"
    kind       = "Ingress"
    metadata = {
      name      = "ingress"
      namespace = var.namespace
      annotations = {
        "external-dns.alpha.kubernetes.io/hostname" = var.dns_name
        "cert-manager.io/cluster-issuer"            = "letsencrypt-${var.environment}"
        "nginx.ingress.kubernetes.io/ssl-redirect"  = "true"
      }
    }
    spec = {
      ingressClassName = "nginx"
      tls = [{
        hosts      = [var.dns_name]
        secretName = "${var.namespace}-tls"
      }]
      rules = [{
        host = var.dns_name
        http = {
          paths = var.paths
        }
      }]
    }
  })
}