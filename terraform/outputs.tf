output "company1_instance_id" {
  value = aws_instance.company1_instance.id
}

output "company1_instance_private_ip" {
  value = aws_instance.company1_instance.private_ip
}

output "company2_instance_id" {
  value = aws_instance.company2_instance.id
}

output "company2_instance_private_ip" {
  value = aws_instance.company2_instance.private_ip
}
