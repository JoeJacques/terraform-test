resource "aws_lb" "network_load" {
  name               = var.TechTest
  internal           = false
  load_balancer_type = var.type
  subnets            = var.subnet_id
}

resource "aws_lb_target_group" "nlb_targets" {
  name     = "tf-example-lb-tg"
  port     = var.port
  protocol = "TCP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group" "web_traffic" {
  name     = "tf-example-lb-tg-web"
  port     = 80
  protocol = "TCP"
  vpc_id   = var.vpc_id
}


resource "aws_lb_listener" "network" {
  load_balancer_arn = aws_lb.network_load.arn
  port              = var.port
  protocol          = "TCP"
 

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_targets.arn
  }
}

resource "aws_lb_listener" "web" {
  load_balancer_arn = aws_lb.network_load.arn
  port              = 80
  protocol          = "TCP"
 

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_traffic.arn
  }
}
