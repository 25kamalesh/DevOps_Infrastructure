
resource "tls_private_key" "MY_LOGIN_KEY_DevOps_Generate" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "MY_LOGIN_KEY_DevOps_private" {
  content  = tls_private_key.MY_LOGIN_KEY_DevOps_Generate.private_key_pem
  filename = "MY_LOGIN_KEY_DevOps_private"
}

resource "aws_key_pair" "MY_LOGIN_KEY_DevOps" {
  key_name   = "MY_LOGIN_KEY_DevOps"
  public_key = tls_private_key.MY_LOGIN_KEY_DevOps_Generate.public_key_openssh
}
