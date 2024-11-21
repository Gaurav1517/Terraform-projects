# Generate a new RSA private key
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create an AWS key pair using the public key from the generated private key
resource "aws_key_pair" "TF_key" {
  key_name   = var.instance_keypair
  public_key = tls_private_key.rsa.public_key_openssh
}

# Save the private key locally for future use
resource "local_file" "TF_key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "${path.module}/tfkey.pem"
}

# # Change the file permissions to 400
# resource "null_resource" "set_permissions" {
#   provisioner "local-exec" {
#     command = "chmod 400 ${path.module}/tfkey.pem"
#   }

#   depends_on = [local_file.TF_key]
# }
