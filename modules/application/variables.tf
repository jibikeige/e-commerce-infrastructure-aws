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

variable "services" {
  description = "List of application services to deploy"
  type        = list(string)
}

variable "base_path" {
  description = "Base directory where service folders are located"
  type        = string
}