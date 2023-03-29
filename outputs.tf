output "vpc" {
  description = "The VPC created by this module"
  value       = aws_vpc.main
}

output "subnets" {
  description = "The subnets created by this module"
  value       = aws_subnet.main
}

output "subnets_by_layer" {
  description = "The subnets created by this module organized in a map by layer."
  value       = { for subnet_layer_name, subnet_layer_data in var.subnet_layers : subnet_layer_name =>
    { for subnet_name, subnet_data in subnet_layer_data.subnets : "${subnet_name}" => aws_subnet.main["${subnet_layer_name}_${subnet_name}"] }
  }
}

output "route_tables" {
  description = "The route tables created by this module"
  value       = aws_route_table.main
}

output "route_tables_by_layer" {
  description = "The route tables created by this module organized in a map by layer."
  value       = { for subnet_layer_name, subnet_layer_data in var.subnet_layers : subnet_layer_name =>
    { for subnet_name, subnet_data in subnet_layer_data.subnets : "${subnet_name}" => aws_route_table.main["${subnet_layer_name}_${subnet_name}"] }
  }
}

output "route_table_associations" {
  description = "The route-table-assocations linking up subnets to their respective tables"
  value       = aws_route_table_association.main
}

output "internet_gateway" {
  description = "The internet gateway created by this module"
  value       = aws_internet_gateway.main
}

output "internet_gateway_route_table" {
  description = "The route table for the internet gateway ingress routes"
  value       = aws_route_table.igw
}

output "s3_bucket_flow_logs" {
  description = "The s3 bucket created by this module when flow-logs are enabled and a bucket-arn is not otherwise provided"
  value       = aws_s3_bucket.flow_logs[*]
}

output "flow_log" {
  description = "The flow-log object created by this module when enabled"
  value       = aws_flow_log.main[*]
}

output "eip_nat_gateway" {
  description = "The elastic IP addresses created by this module for use on nat-gateways"
  value       = aws_eip.nat
}

output "nat_gateway" {
  description = "The nat-gateways created by this module"
  value       = aws_nat_gateway.main
}

output "default_security_group" {
  description = "The ID of the default Security Group created by this module"
  value       = aws_default_security_group.default
}
