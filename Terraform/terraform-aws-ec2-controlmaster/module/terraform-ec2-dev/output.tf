output "ubuntu_ip" {
  value = aws_instance.ubuntu.private_ip
}

output "ubuntu_dns" {
  value = aws_instance.ubuntu.private_dns
}
