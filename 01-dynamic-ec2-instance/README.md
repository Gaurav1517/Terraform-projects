This mini-project demonstrates the creation of an **Amazon EC2 instance** using Terraform with a flexible configuration approach for defining instance types and other parameters. Here’s a description of its features:

- **AMI Selection**: The EC2 instance uses the Amazon Linux 2 AMI ID obtained dynamically through the `aws_ami` data source.
- **Instance Type Configuration**: The instance type is parameterized to allow flexible inputs. It can be defined as:
  - A string value.
  - A list (defaulting to the first element, as shown in the example).
  - A map with a key-value pair (commented for optional usage).
- **Automated User Data**: The `user_data` parameter executes a script (`app-install.sh`) located in the module directory to set up the instance during initialization.
- **Key Pair Association**: A specified key pair ensures secure access to the instance.
- **Security**: The instance is associated with a security group created in the same configuration for defining inbound/outbound rules.
- **Placement**: The instance is deployed in a specified availability zone.
- **Count Parameter**: The `count` attribute allows the creation of one or more instances dynamically by adjusting the value.
- **Tagging**: The instance is tagged with a unique name, including an index value for identification in case of multiple instances.

This project highlights Terraform’s capability to modularize and dynamically parameterize infrastructure resources, enabling scalable and repeatable deployment of EC2 instances.
