data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = "t2.micro"

  subnet_id       = var.subnet_id
  security_groups = var.security_groups

  instance_initiated_shutdown_behavior = "stop"
  private_dns_name_options {
    hostname_type = "ip-name"
  }

  key_name = var.key_name

  tags = {
    Project     = var.project
    Environment = var.environment
    Identifier  = "bastion"
    Name        = "${var.project}-${var.environment_short}-bastion"
  }
}
