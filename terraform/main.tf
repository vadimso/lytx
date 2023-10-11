provider "aws" {
  region = "us-east-1" # Replace with the desired region
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2-security-group"
  description = "Security group for EC2 instances"
}

resource "aws_instance" "company1_instance" {
  ami           = "ami-0261755bbcb8c4a84"I
  instance_type = "t2.micro"          # Replace with your desired instance type
  security_groups = [aws_security_group.ec2_sg.name]
  tags = {
    Name = "Company1-EC2"
  }
}

resource "aws_instance" "company2_instance" {
  ami           = "ami-0261755bbcb8c4a84"
  instance_type = "t2.micro"          # Replace with your desired instance type
  security_groups = [aws_security_group.ec2_sg.name]
  tags = {
    Name = "Company2-EC2"
  }
}
