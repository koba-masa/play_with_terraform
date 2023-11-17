locals {
  private_key = "./tmp/${var.project}_${var.environment_short}_bastion.ed.pem"
  public_key  = "./tmp/${var.project}_${var.environment_short}_bastion.ed.pub"
}

resource "tls_private_key" "keygen" {
  algorithm = "ED25519"
}

resource "local_file" "private_key" {
  filename = local.private_key
  content  = tls_private_key.keygen.private_key_pem
  provisioner "local-exec" {
    command = "chmod 600 ${local.private_key}"
  }
}

resource "local_file" "public_key" {
  filename = local.public_key
  content  = tls_private_key.keygen.public_key_openssh
  provisioner "local-exec" {
    command = "chmod 600 ${local.public_key}"
  }
}

resource "aws_key_pair" "key_pair" {
  key_name   = "${var.project}_${var.environment_short}"
  public_key = tls_private_key.keygen.public_key_openssh

  tags = {
    Project     = var.project
    Environment = var.environment
    Identifier  = "bastion"
    Name        = "${var.project}_${var.environment_short}_bastion"
  }
}
