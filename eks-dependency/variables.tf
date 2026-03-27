variable "environment" {
  type = string
}

variable "name" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "role_name" {
  type = string
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}