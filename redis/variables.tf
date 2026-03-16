variable "region" {
  type = string
}

variable "name" {
  type = string
}

variable "environment" {
  type = string
}

variable "redis_node_type" {
  type = string
}

variable "redis_nodes" {
  type = number
}

variable "engine_version" {
  type = string
}

variable "automatic_failover_enabled" {
  type = bool
}

variable "multi_az_enabled" {
  type = bool
}