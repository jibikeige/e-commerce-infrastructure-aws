variable "environment" {
  type = string
}

variable "name" {
  type = string
}

variable "role_name" {
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

variable "domain_name" {
  type        = string
}

variable "cert_manager_email" {
  type = string
}