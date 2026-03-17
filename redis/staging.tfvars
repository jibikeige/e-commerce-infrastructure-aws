region = "us-east-2"

name        = "teleios-jibike-staging"
environment = "staging"

redis_node_type = "cache.t3.small"
redis_nodes     = 2

engine_version = "7.0"

automatic_failover_enabled = true
multi_az_enabled           = false