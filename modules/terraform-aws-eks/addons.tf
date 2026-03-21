resource "aws_eks_addon" "addons" {
  for_each = toset([
    "vpc-cni",
    "coredns",
    "kube-proxy"
  ])

  cluster_name      = aws_eks_cluster.this.name
  addon_name        = each.value
  resolve_conflicts = "OVERWRITE"

  depends_on = [aws_eks_node_group.this]
}