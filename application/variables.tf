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

variable "manifests" {
  description = "List of Kubernetes manifest file paths"
  type        = list(string)
}