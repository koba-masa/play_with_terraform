resource "aws_security_group" "security_group" {
  name        = "${var.project}_${var.environment_short}_database"
  description = "This security group is attached to database."

  vpc_id = var.vpc_id

  ingress {
    description     = "TCP from Bastion"
    protocol        = "tcp"
    from_port       = 3306
    to_port         = 3306
    security_groups = [var.bastion_security_group_id]
  }

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
    Identifier  = "database"
    Name        = "${var.project}_${var.environment_short}_batabase"
  }
}
