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
variable "dns_name" {
  type = string
}