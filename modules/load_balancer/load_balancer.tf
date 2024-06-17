resource "aws_lb" "load_balancer" {
  name               = var.load_balancer_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.load_balancer_sg.id]
  subnets            = var.load_balancer_subnet_ids

  tags = {
    Name = var.load_balancer_name
  }

  depends_on = [aws_security_group.load_balancer_sg]
}

resource "aws_lb_listener" "load_balancer_http_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.load_balancer_http_target_group.arn
  }

  tags = {
    Name = "${var.load_balancer_name}-http-listener"
  }

  depends_on = [aws_lb.load_balancer, aws_lb_target_group.load_balancer_http_target_group]
}
