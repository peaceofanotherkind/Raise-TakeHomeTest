# Create Database Security Group
resource "aws_security_group" "database-sg" {
  name        = "Database SG"
  description = "Allow inbound traffic from application layer"
  vpc_id      = aws_vpc.demovpc.id
  }

resource "Allow traffic from application layer" "ingress"{
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = [aws_security_group.demosg.id]
}


#ingress {
#    description     = "Allow traffic from application layer"
#    from_port       = 3306
#    to_port         = 3306
#    protocol        = "tcp"
#    security_groups = [aws_security_group.demosg.id]
#  }


resource "aws_security_group_rule" "egress"{
  type              = "egress"
  from_port         = 32768
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}


#egress {
#    from_port   = 32768
#    to_port     = 65535
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
tags = {
    Name = "Database SG"
  }