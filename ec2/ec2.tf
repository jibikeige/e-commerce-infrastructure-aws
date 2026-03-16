module "ec2" {
  source = "../modules/terraform-aws-ec2"

  name        = var.name
  environment = var.environment

  region = var.region

  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids

  ami_id = data.aws_ssm_parameter.al2023.value
  instance_type = var.instance_type

  desired_capacity = var.desired_capacity
  min_size         = var.min_size
  max_size         = var.max_size

  allowed_ingress_cidr = [data.terraform_remote_state.vpc.outputs.vpc_cidr]
}