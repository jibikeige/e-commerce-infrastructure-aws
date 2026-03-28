variable "environment" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "cluster_endpoint" {
  type = string
}

variable "aws_eks_cluster_identity" {
  type = string
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "manifests" {
  type = any
}

variable "namespace" {
  type    = string
  default = "rideshare-prod"
}

variable "db_secret_name" {
  type = string
}

variable "redis_secret_name" {
  type = string
}

variable "app_secret_name" {
  type = string
}

variable "dns_name" {
  type = string
}

variable "paths" {
  type = any
}