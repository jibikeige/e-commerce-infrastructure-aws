output "ec2_asg_name" {
  value = module.ec2.autoscaling_group_name
}

output "ec2_security_group_id" {
  value = module.ec2.security_group_id
}