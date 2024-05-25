resource "aws_security_group" "application_load_balancer_sg" {
  name        = "application_load_balancer_sg"
  description = "Inbound traffic port 80"
  vpc_id      = aws_vpc.main.id

  
}

resource "aws_vpc_security_group_ingress_rule" "load-balancer-ingress" {
  
}

resource "aws_vpc_security_group_egress_rule" "load-balancer-egress" {
  
}



resource "aws_security_group" "container_from_alb_sg" {
 
}

resource "aws_vpc_security_group_ingress_rule" "container-ingress" {
  
}

resource "aws_vpc_security_group_egress_rule" "container-egress" {
  
}


resource "aws_lb" "fac-lb" {
  
  
}