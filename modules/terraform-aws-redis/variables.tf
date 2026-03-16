variable "region" {
  type = string
}

variable "name" {
  description = "Redis cluster name"
  type        = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  description = "Private subnets for Redis"
  type        = list(string)
}

variable "node_type" {
  description = "Redis instance type"
  type        = string
}

variable "num_cache_nodes" {
  type = number
}

variable "engine_version" {
  type    = string
  default = "7.0"
}

variable "automatic_failover_enabled" {
  type    = bool
  default = true
}

variable "multi_az_enabled" {
  type    = bool
  default = true
}

variable "allowed_ingress_cidr" {
  type    = list(string)
  default = ["10.0.0.0/8"]
}