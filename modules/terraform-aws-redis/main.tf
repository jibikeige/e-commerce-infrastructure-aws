resource "aws_security_group" "redis" {
  name        = "${var.name}-redis-sg"
  description = "Redis security group"
  vpc_id      = var.vpc_id

  ingress {
    description = "Redis access"
    from_port   = 6379
    to_port     = 6379
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
    Name        = "${var.name}-redis-sg"
    Environment = var.environment
  }
}

resource "aws_elasticache_subnet_group" "this" {
  name       = "${var.name}-redis-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "${var.name}-redis-subnet-group"
    Environment = var.environment
  }
}

resource "aws_elasticache_replication_group" "this" {

  replication_group_id = "${var.name}-redis"

  description = "Redis cluster for ${var.environment}"

  node_type = var.node_type

  engine         = "redis"
  engine_version = var.engine_version
  port           = 6379

  subnet_group_name  = aws_elasticache_subnet_group.this.name
  security_group_ids = [aws_security_group.redis.id]

  num_cache_clusters = var.num_cache_nodes

  automatic_failover_enabled = var.automatic_failover_enabled
  multi_az_enabled           = var.multi_az_enabled

  at_rest_encryption_enabled = false
  transit_encryption_enabled = false

  apply_immediately = true

  tags = {
    Name        = "${var.name}-redis"
    Environment = var.environment
  }
}