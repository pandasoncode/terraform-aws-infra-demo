variable "vpc_name" {
  description = "The name of the VPC"
  nullable    = false
  sensitive   = false
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  nullable    = false
  sensitive   = false
  type        = string
}

variable "availability_zones" {
  description = "The availability zones for the VPC"
  nullable    = false
  sensitive   = false
  type        = list(string)
}
