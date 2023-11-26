resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = var.vpc_id

  tags = {
    Project     = var.project
    Environment = var.environment
    Name        = "${var.project}_${var.environment_short}"
  }
}
