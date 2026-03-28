variable "region" {
  type        = string
  description = ""
}

variable "name" {
  description = "Database name prefix"
  type        = string
}

variable "environment" {
  type        = string
  description = ""
}

variable "vpc_id" {
  type        = string
  description = ""
}

variable "private_subnet_ids" {
  type        = list(string)
  description = ""
}

variable "db_name" {
  type        = string
  description = ""
}

variable "username" {
  type        = string
  description = ""
}

variable "instance_class" {
  type        = string
  description = ""
}

variable "allocated_storage" {
  type        = number
  description = ""
}

variable "multi_az" {
  type        = bool
  description = ""
}

variable "backup_retention_period" {
  type        = number
  description = ""
}

variable "storage_encrypted" {
  type        = bool
  default     = true
  description = ""
}

variable "engine_version" {
  type        = string
  default     = "15"
  description = ""
}