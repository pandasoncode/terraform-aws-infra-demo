variable "aws_access_key" {
  description = "AWS access key"
  nullable    = false
  sensitive   = true
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret access key"
  nullable    = false
  sensitive   = true
  type        = string
}

variable "environment" {
  default     = "development"
  description = "Environment"
  nullable    = false
  sensitive   = false
  type        = string
}

variable "project_name" {
  description = "Project name"
  nullable    = false
  sensitive   = false
  type        = string
}
