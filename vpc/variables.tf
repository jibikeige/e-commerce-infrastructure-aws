variable "environment" {
  type        = string
  description = ""
}

variable "name" {
  description = "VPC name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
}
variable "private_subnets" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
}

variable "azs" {
  description = "Availability zones"
  type        = list(string)
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "additional_tags" {
  type    = map(string)
  default = {}
}