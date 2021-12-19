output "private_ip" {
  value = aws_lightsail_instance.lightsail_instance.private_ip_address
}

output "public_ip" {
  value = aws_lightsail_instance.lightsail_instance.public_ip_address
}