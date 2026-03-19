region = "us-east-2"

name        = "teleios-jibike-prod"
environment = "prod"

redis_node_type = "cache.t4g.micro"
redis_nodes     = 3

engine_version = "7.0"

automatic_failover_enabled = false
multi_az_enabled           = false