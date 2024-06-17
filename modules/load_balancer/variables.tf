variable "load_balancer_name" {
  description = "Name of the load balancer"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "load_balancer_subnet_ids" {
  description = "Subnet IDs for the load balancer"
  type        = list(string)
}
