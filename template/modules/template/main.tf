resource "template" "template" {
  tags = {
    Project     = var.project
    Environment = var.environment
    Identifier  = "template"
    Name        = "${var.project}_${var.environment_short}_template"
  }
}
