region = "us-east-2"

name        = "teleios-jibike-staging"
environment = "staging"

redis_node_type = "cache.t4g.micro"
redis_nodes     = 2

engine_version = "7.0"

automatic_failover_enabled = false
multi_az_enabled           = false