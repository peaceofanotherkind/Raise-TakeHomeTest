# Create Database Security Group
#resource "aws_security_group" "database-sg" {
#  name        = "Database SG"
#  description = "Allow inbound traffic from application layer"
#  vpc_id      = aws_vpc.demovpc.id
#  }

resource "aws_security_group_rule" "ingress"{
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = [aws_security_group.demosg.id]
}

resource "aws_lb_listener" "external-elb" {
  load_balancer_arn = aws_lb.external-alb.arn
  port              = "80"
  protocol          = "HTTP"
default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.external-alb.arn
  }
}
