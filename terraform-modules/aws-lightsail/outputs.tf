output "instance_id" {
  value = aws_lightsail_instance.lightsail_instance.id
}

output "instance_public_ip" {
  value = aws_lightsail_static_ip.lightsail_instance_static_ip.ip_address
}