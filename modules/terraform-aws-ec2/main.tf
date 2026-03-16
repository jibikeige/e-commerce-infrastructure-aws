resource "aws_security_group" "ec2" {
  name        = "${var.name}-ec2-sg"
  description = "Security group for EC2 autoscaling"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ingress_cidr
  }

  ingress {
    description = "App traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_ingress_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.name}-ec2-sg"
    Environment = var.environment
  }
}