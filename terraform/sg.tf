resource "aws_security_group_rule" "company1_to_company2" {
  type        = "ingress"
  from_port   = 0
  to_port     = 65535
  protocol    = "tcp"
  #cidr_blocks = [aws_instance.company2_instance.private_ip]
  cidr_blocks = ["172.31.28.39/32"]
  security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_security_group_rule" "company2_to_company1" {
  type        = "ingress"
  from_port   = 0
  to_port     = 65535
  protocol    = "tcp"
  #cidr_blocks = [aws_instance.company1_instance.private_ip]
  cidr_blocks = ["172.31.16.115/32"]
  security_group_id = aws_security_group.ec2_sg.id
}
