resource "aws_security_group" "ec2_sg" {
  name   = "${var.autoscaling_group_name}-ec2-sg"
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.autoscaling_group_name}-ec2-sg"
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.load_balancer_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
