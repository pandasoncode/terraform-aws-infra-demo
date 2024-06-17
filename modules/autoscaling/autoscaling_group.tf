resource "aws_autoscaling_group" "asg" {
  name             = "${var.autoscaling_group_name}-asg"
  max_size         = var.autoscaling_max_size
  min_size         = var.autoscaling_min_size
  desired_capacity = var.autoscaling_desired_capacity

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }

  target_group_arns   = [var.target_group.arn]
  health_check_type   = "ELB"
  vpc_zone_identifier = var.subnet_ids

  dynamic "tag" {
    for_each = data.aws_default_tags.default_tags.tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

  tag {
    key                 = "Name"
    value               = var.autoscaling_group_name
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "asg_policy" {
  name                   = "Target Tracking Policy"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ALBRequestCountPerTarget"
      resource_label         = "${var.load_balancer.arn_suffix}/${var.target_group.arn_suffix}"
    }
    target_value = 300
  }
}
