module "applications" {
  source = "../modules/applications"

  services = [
    "trip-service"
  ]

  base_path = "${path.module}/services"
}