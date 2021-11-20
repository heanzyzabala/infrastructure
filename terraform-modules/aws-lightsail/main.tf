resource "aws_lightsail_instance" "lightsail_instance" {
  name              = var.name
  availability_zone = var.availability_zone
  blueprint_id      = var.blueprint_id
  bundle_id         = var.bundle_id
}

resource "aws_lightsail_static_ip" "lightsail_instance_static_ip" {
  name = "${var.name}_static_ip"
}

resource "aws_lightsail_static_ip_attachment" "lightsail_instance_static_ip_attachment" {
  static_ip_name = aws_lightsail_static_ip.lightsail_instance_static_ip.id
  instance_name = aws_lightsail_instance.lightsail_instance.id
}