name           = "teleios-jibike-dev-eks"
region         = "us-east-2"
environment    = "dev"
node_name      = "teleios-jibike-dev-node-group"
desired_nodes  = 2
min_nodes      = 2
max_nodes      = 3
instance_types = ["t3.medium""]
role_name      = "teleios-jibike-dev-eks-iam"

aws_auth_users = [
  {
    userarn  = "arn:aws:iam::221693237976:user/Jibike"
    username = "jibike"
    groups   = ["system:masters"]
  }
]