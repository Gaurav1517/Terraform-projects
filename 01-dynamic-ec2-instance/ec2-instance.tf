resource "aws_instance" "web" {
  ami = data.aws_ami.amzlinux2.id
  # instance_type = var.instance_type_string # for string
  instance_type = var.instance_type_list[0] # for list
  # instance_type = var.instance_type_map["prod"] # for map
  user_data              = file("${path.module}/app-install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
  availability_zone      = var.availability_zone
  count                  = 1


  tags = {
    Name = "EC2-Instance-${count.index}"
  }
}
