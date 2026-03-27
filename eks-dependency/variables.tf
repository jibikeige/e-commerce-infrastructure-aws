variable "environment" {
  type = string
}

variable "name" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "oidc_provider_arn" {
  type = string
}

variable "oidc_provider_url" {
  type = string
}

variable "role_name" {
  type = string
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}