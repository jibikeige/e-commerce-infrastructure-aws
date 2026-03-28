variable "environment" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "db_secret_name" {
  type = string
}

variable "redis_secret_name" {
  type = string
}