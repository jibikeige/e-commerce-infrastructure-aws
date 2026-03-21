resource "aws_eks_cluster" "this" {
  name     = var.name
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = "1.34"

  vpc_config {
    subnet_ids              = concat(var.public_subnets, var.private_subnets)
    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs     = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.name}"
    Environment = var.environment
  }
}

resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.name}-node-group"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = var.private_subnets

  disk_size = 20

  scaling_config {
    desired_size = var.desired_nodes
    max_size     = var.max_nodes
    min_size     = var.min_nodes
  }

  instance_types = var.instance_types
  ami_type       = "AL2023_x86_64_STANDARD"

  tags = {
    Name        = "${var.node_name}"
    Environment = var.environment
  }
}

resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapUsers = yamlencode(var.aws_auth_users)
  }

  depends_on = [aws_eks_node_group.this]
}