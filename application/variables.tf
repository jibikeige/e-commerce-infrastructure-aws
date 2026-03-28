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
  description = "Kubernetes manifests per service"
  type = map(object({
    deployment = any
    service    = any
    hpa        = any
  }))
}