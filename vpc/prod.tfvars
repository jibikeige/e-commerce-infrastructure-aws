region = "us-east-2"

name        = "teleios-jibike-prod-vpc"
environment = "prod"

vpc_cidr = "10.2.0.0/22"

azs = [
  "us-east-2a",
  "us-east-2b",
  "us-east-2c"
]

public_subnets = [
  "10.2.0.0/24",
  "10.2.1.0/24"
]

private_subnets = [
  "10.2.2.0/24",
  "10.2.3.0/24"
]

additional_tags = {
  "kubernetes.io/cluster/teleios-jibike-prod-eks" = "shared"
}