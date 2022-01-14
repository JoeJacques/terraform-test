
resource "aws_launch_configuration" "autoscaling_config" {
  name_prefix   = var.TechTest
  image_id      = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type
  iam_instance_profile = var.profile
  associate_public_ip_address  = var.associate_public_ip_address 
  security_groups = var.security_group_ids
  user_data = var.user_data

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "autoscaling_group" {
  name                 = var.TechTest
  launch_configuration = aws_launch_configuration.autoscaling_config.name
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity = var.max_size
  target_group_arns    = var.target_group_arns
  vpc_zone_identifier = var.subnet_id

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_schedule" "scaledown" {
  scheduled_action_name  = "scale_down"
  min_size               = var.min_size 
  max_size               = var.max_size
  desired_capacity       = 2
  recurrence = var.scale_down_cron
  time_zone = var.timezone
  autoscaling_group_name = aws_autoscaling_group.autoscaling_group.name
}

resource "aws_autoscaling_schedule" "scaleup" {
  scheduled_action_name  = "scale_down"
  min_size               = var.min_size 
  max_size               = var.max_size 
  desired_capacity       = 3
  recurrence = var.scale_up_cron
  time_zone = var.timezone
  autoscaling_group_name = aws_autoscaling_group.autoscaling_group.name
}
