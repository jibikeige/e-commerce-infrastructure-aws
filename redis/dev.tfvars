region = "us-east-2"

name        = "teleios-jibike-dev"
environment = "dev"

redis_node_type = "cache.t4g.micro"
redis_nodes     = 1

engine_version = "7.0"

automatic_failover_enabled = false
multi_az_enabled           = false