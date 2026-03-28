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
  description = "Kubernetes manifests per service"
  type = map(object({
    deployment = any
    service    = any
    hpa        = any
  }))
}

variable "namespace" {
  type    = string
  default = "rideshare-prod"
}