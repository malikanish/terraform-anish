output "vpc_id" {
  value = aws_vpc.anish_vpc.id
}

# output "public_subnet_ids" {
#   value = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id]
# }

# output "private_subnet_id" {
#   value = aws_subnet.private_subnet.id
# }
