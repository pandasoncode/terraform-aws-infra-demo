resource "aws_lb_target_group" "load_balancer_http_target_group" {
  name     = "${var.load_balancer_name}-http-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = "traffic-port"
    interval            = 60
    timeout             = 30
    healthy_threshold   = 2
    unhealthy_threshold = 5
  }

  tags = {
    Name = "${var.load_balancer_name}-http-tg"
  }
}
