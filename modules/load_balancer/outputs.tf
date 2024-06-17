output "load_balancer" {
  description = "The load balancer"
  value       = aws_lb.load_balancer
}

output "target_group" {
  description = "The target group"
  value       = aws_lb_target_group.load_balancer_http_target_group
}

output "load_balancer_security_group_id" {
  description = "The security group id of the load balancer"
  value       = aws_security_group.load_balancer_sg.id
}
