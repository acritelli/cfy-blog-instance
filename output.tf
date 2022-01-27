output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.instance.id
}

output "instance_ip" {
  description = "EC2 Instance IP address"
  value       = aws_instance.instance.public_ip
}
