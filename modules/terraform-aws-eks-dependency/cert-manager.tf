resource "kubernetes_namespace" "cert_manager" {
  metadata {
    name = "cert-manager"
  }
}

resource "helm_release" "cert_manager" {
  name      = "cert-manager"
  namespace = kubernetes_namespace.cert_manager.metadata[0].name

  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "v1.14.5"

  create_namespace = true
  wait             = true
  wait_for_jobs    = true
  timeout          = 300

  set {
    name  = "installCRDs"
    value = "true"
  }

  depends_on = [kubernetes_namespace.cert_manager]
}