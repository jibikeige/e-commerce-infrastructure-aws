resource "time_sleep" "wait_for_cert_manager" {
  create_duration = "30s"

  depends_on = [helm_release.cert_manager]
}

resource "kubectl_manifest" "cluster_issuer" {
  yaml_body = yamlencode({
    apiVersion = "cert-manager.io/v1"
    kind       = "ClusterIssuer"
    metadata = {
      name = "letsencrypt-${var.environment}"
    }
    spec = {
      acme = {
        server = "https://acme-v02.api.letsencrypt.org/directory"
        email  = var.cert_manager_email
        privateKeySecretRef = {
          name = "letsencrypt-${var.environment}"
        }
        solvers = [{
          http01 = {
            ingress = {
              ingressClassName = "nginx"
            }
          }
        }]
      }
    }
  })

  depends_on = [time_sleep.wait_for_cert_manager]
}