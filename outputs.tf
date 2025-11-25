output "instances" {
  description = "IDs of the EC2 instances"
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

# NEW > [Artem Was Here > See Below]: Show attached EBS block devices (includes the new data volume)
output "data_volume_block_devices" {
  description = "EBS block devices attached to the instance, including the extra data volume."
  value       = module.acme-ec2.ebs_block_device
}
