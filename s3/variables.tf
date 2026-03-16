variable "region" {
  type = string
}

variable "environment" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "versioning_enabled" {
  type = bool
}

variable "lifecycle_enabled" {
  type = bool
}

variable "transition_days" {
  type = number
}