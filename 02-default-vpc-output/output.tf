# Retrieve the default VPC ID
data "aws_vpc" "default" {
  default = true
}

# Output the default VPC ID
output "output_default_vpc" {
  value       = data.aws_vpc.default.id
  sensitive   = true
  description = "The ID of the default VPC"
}

# Retrieve all subnet IDs in the default VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Retrieve details for each subnet
data "aws_subnet" "subnet_details" {
  for_each = toset(data.aws_subnets.default.ids)
  id       = each.value
}

# Output the CIDR blocks of all subnets in the default VPC
output "subnet_cidr_blocks" {
  value       = [for s in data.aws_subnet.subnet_details : s.cidr_block]
  description = "The CIDR blocks of all subnets in the default VPC"
}

# Retrieve all route tables in the default VPC
data "aws_route_tables" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Output the route table IDs
output "route_table_ids" {
  value       = [for rt in data.aws_route_tables.default.ids : rt]
  description = "The IDs of all route tables in the default VPC"
}

# Retrieve all internet gateways in the default VPC
data "aws_internet_gateway" "default" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Output the internet gateway ID
output "internet_gateway_id" {
  value       = data.aws_internet_gateway.default.id
  description = "The ID of the internet gateway in the default VPC"
}
