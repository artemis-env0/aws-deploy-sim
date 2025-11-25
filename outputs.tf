output "instances" {
  description = "ID of the EC2 instance"
  value       = module.acme-ec2.id
}

output "public_ip" {
  description = "Public IP address of the instance"
  value       = module.acme-ec2.public_ip
}

output "private_ip" {
  description = "Private IP address of the instance"
  value       = module.acme-ec2.private_ip
}

output "data_ebs_volumes" {
  description = "Map of additional EBS volumes created and attached to the instance."
  value       = module.acme-ec2.ebs_volumes
}
