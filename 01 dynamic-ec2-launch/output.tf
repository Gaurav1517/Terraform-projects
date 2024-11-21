#Output the instance ID:
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.web[0].id
}

# Output the public IP address:
output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.web[0].public_ip
}

#Output the private IP address:
output "instance_private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.web[0].private_ip
}
