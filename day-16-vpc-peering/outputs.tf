output "vpc1_id" {
  description = "ID of VPC 1"
  value       = aws_vpc.vpc1.id
}

output "vpc2_id" {
  description = "ID of VPC 2"
  value       = aws_vpc.vpc2.id
}

output "vpc_peering_connection_id" {
  description = "ID of the VPC peering connection"
  value       = aws_vpc_peering_connection.peer.id
}

output "vpc1_cidr" {
  description = "CIDR block of VPC 1"
  value       = aws_vpc.vpc1.cidr_block
}

output "vpc2_cidr" {
  description = "CIDR block of VPC 2"
  value       = aws_vpc.vpc2.cidr_block
}
