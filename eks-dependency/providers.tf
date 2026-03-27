provider "aws" {
  region = var.region
}

provider "aws" {
  region = var.region
}

provider "helm" {
  kubernetes {
    host = data.aws_eks_cluster.this.endpoint

    cluster_ca_certificate = base64decode(
      data.aws_eks_cluster.this.certificate_authority[0].data
    )

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = [
        "eks",
        "get-token",
        "--region", var.region,
        "--cluster-name", var.cluster_name
      ]
    }
  }
}

provider "kubernetes" {
  host = data.aws_eks_cluster.this.endpoint

  cluster_ca_certificate = base64decode(
    data.aws_eks_cluster.this.certificate_authority[0].data
  )

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = [
      "eks",
      "get-token",
      "--region", var.region,
      "--cluster-name", var.cluster_name
    ]
  }
}

provider "kubectl" {
  host = data.aws_eks_cluster.this.endpoint

  cluster_ca_certificate = base64decode(
    data.aws_eks_cluster.this.certificate_authority[0].data
  )

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = [
      "eks",
      "get-token",
      "--region", var.region,
      "--cluster-name", var.cluster_name
    ]
  }

  load_config_file = false
}