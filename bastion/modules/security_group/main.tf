resource "aws_security_group" "security_group" {
  name        = "${var.project}_${var.environment_short}_bastion"
  description = "This security group is attached to bastion."

  vpc_id = var.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Project     = var.project
    Environment = var.environment
    Identifier  = "bastion"
    Name        = "${var.project}_${var.environment_short}_bastion"
  }
}
