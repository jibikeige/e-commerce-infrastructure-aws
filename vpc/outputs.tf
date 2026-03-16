// outputs.tf in the parent module (root)

output "vpc_id" {
  description = "The ID of the VPC from the VPC module"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs from the VPC module"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs from the VPC module"
  value       = module.vpc.private_subnet_ids
}

output "vpc_cidr" {
  description = "List of private subnet IDs from the VPC module"
  value       = module.vpc.vpc_cidr
}
