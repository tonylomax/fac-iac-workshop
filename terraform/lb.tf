resource "aws_security_group" "application_load_balancer_sg" {
  name        = "application_load_balancer_sg"
  description = "Inbound traffic port 80"
  vpc_id      = aws_vpc.main.id

  
}

resource "aws_vpc_security_group_ingress_rule" "load-balancer-ingress" {
  security_group_id = aws_security_group.application_load_balancer_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "load-balancer-egress" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}



resource "aws_security_group" "container_from_alb_sg" {
  name        = "container_from_alb_sg"
  description = "Inbound traffic from ApplicationLoadBalancerSecurityGroup"
  vpc_id      = aws_vpc.main.id

  
}

resource "aws_vpc_security_group_ingress_rule" "container-ingress" {
  security_group_id = aws_security_group.container_from_alb_sg.id
  cidr_ipv4         = aws_security_group.application_load_balancer_sg.id
  from_port         = 0
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "container-egress" {
  security_group_id = aws_security_group.container_from_alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}





resource "aws_lb" "fac-lb" {
  name               = "fac-lb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.application_load_balancer_sg.id]
  subnets            = [for subnet in aws_subnet.public : subnet.id]

  access_logs {
    bucket  = aws_s3_bucket.lb_logs.id
    prefix  = "fac-lb"
    enabled = true
  }

  
}