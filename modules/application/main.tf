resource "kubernetes_manifest" "deployment" {
  for_each = var.manifests

  manifest = each.value.deployment
}

resource "kubernetes_manifest" "service" {
  for_each = var.manifests

  manifest = each.value.service

  depends_on = [
    kubernetes_manifest.deployment
  ]
}

resource "kubernetes_manifest" "hpa" {
  for_each = var.manifests

  manifest = each.value.hpa

  depends_on = [
    kubernetes_manifest.deployment
  ]
}