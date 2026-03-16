region = "us-east-2"

name        = "teleios-jibike-prod"
environment = "prod"

redis_node_type = "cache.m6g.large"
redis_nodes     = 3

engine_version = "7.0"

automatic_failover_enabled = true
multi_az_enabled           = true