resource "template" "template" {
  tags = {
    Project     = var.project
    Environment = var.environment
    Identifier  = "template"
    Name        = "${var.project}_${terraform.workspace}_template"
  }
}
