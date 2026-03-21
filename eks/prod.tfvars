name           = "teleios-jibike-prod-eks"
region         = "us-east-2"
environment    = "prod"
node_name      = "teleios-jibike-prod-node-group"
desired_nodes  = 2
min_nodes      = 1
max_nodes      = 2
instance_types = ["t3.medium"]
role_name      = "teleios-jibike-prod-eks-iam"


aws_auth_users = [
  {
    userarn  = "arn:aws:iam::221693237976:user/Jibike"
    username = "jibike"
    groups   = ["system:masters"]
  }
]