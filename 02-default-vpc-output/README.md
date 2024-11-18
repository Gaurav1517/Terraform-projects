To retrieve and display the default VPC data as output using Terraform, 
you can utilize the `aws_vpc` data source. This allows you to query information 
about the default VPC in your AWS account, such as its ID, CIDR block, Route table, 
Internet Gateway, and associated tags.
By configuring an output block in your Terraform configuration, you can easily display
this information after applying the configuration.
