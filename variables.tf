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

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}
