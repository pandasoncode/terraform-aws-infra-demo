variable "rds_instance_name" {
  description = "Name of the RDS instance"
  nullable    = false
  sensitive   = false
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  nullable    = false
  sensitive   = false
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the RDS instance"
  nullable    = false
  sensitive   = false
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones for the RDS instance"
  nullable    = false
  sensitive   = false
  type        = list(string)
}
