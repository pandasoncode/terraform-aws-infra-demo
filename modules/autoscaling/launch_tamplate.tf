data "aws_default_tags" "default_tags" {}

resource "aws_launch_template" "launch_template" {
  name                   = "${var.autoscaling_group_name}-launch-template"
  image_id               = var.ami_id
  instance_type          = var.instance_type
  key_name               = "${var.autoscaling_group_name}-kp"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.autoscaling_group_name}-instance"
    }
  }
  iam_instance_profile {
    name = var.iam_instance_profile_name
  }

  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = var.volume_size
    }
  }
}
