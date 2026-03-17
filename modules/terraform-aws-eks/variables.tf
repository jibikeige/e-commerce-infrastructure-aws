variable "name" {
  type = string
}

variable "role_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "desired_nodes" {
  type = number
}

variable "min_nodes" {
  type = number
}

variable "max_nodes" {
  type = number
}

variable "instance_types" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "node_name" {}

variable "region" {
  description = "AWS region where resources will be created"
  type        = string
}