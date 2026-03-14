region = "us-east-2"

name        = "teleios-jibike-dev-vpc"
environment = "dev"

vpc_cidr = "10.0.0.0/22"

azs = [
  "us-east-2a",
  "us-east-2b"
]

public_subnets = [
  "10.0.0.0/24",
  "10.0.2.0/24"
]

private_subnets = [
  "10.0.1.0/24",
  "10.0.3.0/24"
]