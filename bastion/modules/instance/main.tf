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

  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_groups

  iam_instance_profile = var.iam_instance_profile

  instance_initiated_shutdown_behavior = "stop"
  private_dns_name_options {
    hostname_type = "ip-name"
  }

  key_name = var.key_name

  tags = {
    Project     = var.project
    Environment = var.environment
    Identifier  = "bastion"
    Name        = "${var.project}_${var.environment_short}_bastion"
  }
}

# 節約のため、EIPは割り当てない
# resource "aws_eip" "bastion_ip_address" {
#   instance = aws_instance.bastion.id
#   domain   = "vpc"

#   tags = {
#     Project     = var.project
#     Environment = var.environment
#     Identifier  = "bastion"
#     Name        = "${var.project}-${var.environment_short}-bastion"
#   }
# }
