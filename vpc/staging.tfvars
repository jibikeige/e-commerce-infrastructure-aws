region = "us-east-2"

name        = "teleios-jibike-staging-vpc"
environment = "staging"

vpc_cidr = "10.1.0.0/22"

azs = [
  "us-east-2a",
  "us-east-2b"
]

public_subnets = [
  "10.1.0.0/24",
  "10.1.1.0/24"
]

private_subnets = [
  "10.1.2.0/24",
  "10.1.3.0/24"
]

additional_tags = {
  "kubernetes.io/cluster/teleios-jibike-staging-eks" = "shared"
}