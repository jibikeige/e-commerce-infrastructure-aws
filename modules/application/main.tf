resource "kubernetes_manifest" "deployment" {
  for_each = toset(var.services)

  manifest = yamldecode(
    file("${var.base_path}/${each.key}/deployment.yaml")
  )
}

resource "kubernetes_manifest" "service" {
  for_each = toset(var.services)

  manifest = yamldecode(
    file("${var.base_path}/${each.key}/service.yaml")
  )

  depends_on = [
    kubernetes_manifest.deployment
  ]
}

resource "kubernetes_manifest" "hpa" {
  for_each = toset(var.services)

  manifest = yamldecode(
    file("${var.base_path}/${each.key}/hpa.yaml")
  )

  depends_on = [
    kubernetes_manifest.deployment
  ]
}