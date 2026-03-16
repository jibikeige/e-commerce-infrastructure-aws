variable "region" {
  type = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "environment" {
  type = string
}

variable "versioning_enabled" {
  type    = bool
  default = true
}

variable "lifecycle_enabled" {
  type    = bool
  default = true
}

variable "transition_days" {
  description = "Days before moving objects to cheaper storage"
  type        = number
  default     = 30
}