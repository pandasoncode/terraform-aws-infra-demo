variable "autoscaling_group_name" {
  description = "Name of the autoscaling group"
  nullable    = false
  sensitive   = false
  type        = string
}

variable "ami_id" {
  description = "AMI ID"
  nullable    = false
  sensitive   = false
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  nullable    = false
  sensitive   = false
  type        = string
}

variable "volume_size" {
  description = "Volume size"
  nullable    = false
  sensitive   = false
  type        = number
}

variable "iam_instance_profile_name" {
  description = "Name of the IAM instance profile"
  nullable    = false
  sensitive   = false
  type        = string
}

variable "autoscaling_max_size" {
  description = "Maximum size of the autoscaling group"
  nullable    = false
  sensitive   = false
  type        = number
}

variable "autoscaling_min_size" {
  description = "Minimum size of the autoscaling group"
  nullable    = false
  sensitive   = false
  type        = number
}

variable "autoscaling_desired_capacity" {
  description = "Desired capacity of the autoscaling group"
  nullable    = false
  sensitive   = false
  type        = number
}

variable "vpc_id" {
  description = "VPC ID"
  nullable    = false
  sensitive   = false
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs in which the instances will be launched"
  nullable    = false
  sensitive   = false
  type        = list(string)
}

variable "load_balancer" {
  description = "The load balancer"
  nullable    = false
  sensitive   = false
  type        = any
}

variable "target_group" {
  description = "The target group"
  nullable    = false
  sensitive   = false
  type        = any
}

variable "load_balancer_security_group_id" {
  description = "The security group id of the load balancer"
  nullable    = false
  sensitive   = false
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  nullable    = false
  sensitive   = false
  type        = string
}
