variable "name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "ami_id" {
  type = string
}

variable "region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "instance_type" {
  type = string
}

variable "desired_capacity" {
  type    = number
  default = 1
}

variable "min_size" {
  type    = number
  default = 1
}

variable "max_size" {
  type    = number
  default = 3
}

variable "allowed_ingress_cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}