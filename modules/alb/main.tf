resource "aws_lb" "my_alb" {
  name               = "application-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = var.subnet_id

}

#Listener

resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_tg.arn
  }
}

#Target group

resource "aws_lb_target_group" "my_tg" {
  name     = "my-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}


#Target group attachment

resource "aws_lb_target_group_attachment" "my-tga" {
  count = length(var.instances)
  target_group_arn = aws_lb_target_group.my_tg.arn
  target_id        = var.instances[count.index]
  port             = 80
}