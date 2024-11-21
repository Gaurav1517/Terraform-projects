resource "aws_instance" "web" {
  ami = data.aws_ami.amzlinux2.id
  # instance_type = var.instance_type_string # for string
  instance_type = var.instance_type_list[1] # for list
  # instance_type = var.instance_type_map["prod"] # for map
  user_data              = file("${path.module}/app-install.tpl")
  key_name               = aws_key_pair.TF_key.key_name
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
  availability_zone      = var.availability_zone
  count                  = 1

  # Root block device with 30GB and GP3 type
  root_block_device {
    volume_size = 30    # Size in GiB
    volume_type = "gp3" # General Purpose SSD
  }

  tags = {
    Name = "EC2-Instance-${count.index}"
  }
}