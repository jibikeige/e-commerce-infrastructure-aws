module "applications" {
  source = "../modules/application"

  services = [
    "trip-service"
  ]

  base_path = "${path.module}/services"
}