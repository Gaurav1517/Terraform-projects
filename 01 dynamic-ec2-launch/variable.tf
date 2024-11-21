# AWS Region
variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Region in which AWS Resource to be created."
}

# AWS Instance Type - string
variable "instance_type_string" {
  description = "EC2 Instance type string"
  type        = string
  default     = "t2.micro"
}


# AWS EC2 Instance Type -List
variable "instance_type_list" {
  description = "EC2 Instance Type list"
  type        = list(string)
  default     = ["t2.micro", "t2.medium", "t3.large"]
}

# AWS EC2 Instance Type -Map
variable "instance_type_map" {
  description = "EC2 Instance Type Map"
  type        = map(string)
  default = {
    "dev"  = "t3.micro"
    "test" = "t3.small"
    "prod" = "t2.micro"
  }
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "AWS Key Pair that need to be assocaiated with EC2 Instnace"
  type        = string
  default     = "terraform-key"
}

# AWS EC2 Security Group
variable "ec2_security_group" {
  description = "EC2 Security group "
  type        = string
  default     = "ec2_security_group"
}

variable "availability_zone" {
  description = "EC2  Instance Availablility Zone"
  type        = string
  default     = "us-east-1a"
}

