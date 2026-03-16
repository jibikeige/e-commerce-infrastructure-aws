resource "aws_security_group" "this" {
  name        = "${var.name}-${var.environment}-sg"
  description = "Security group for EC2 ASG"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
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
    Name        = "${var.name}-sg"
    Environment = var.environment
  }
}

resource "aws_launch_template" "this" {
  name_prefix   = "${var.name}-${var.environment}-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.this.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name        = "${var.name}-instance"
      Environment = var.environment
    }
  }
}

resource "aws_autoscaling_group" "this" {
  name                = "${var.name}-${var.environment}-asg"
  desired_capacity    = var.desired_capacity
  min_size            = var.min_size
  max_size            = var.max_size
  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  health_check_type = "EC2"

  tag {
    key                 = "Name"
    value               = "${var.name}-asg"
    propagate_at_launch = true
  }
}