resource "aws_iam_instance_profile" "bastion_profile" {
  name = "${var.project}_${var.environment_short}_bastion"
  role = aws_iam_role.bastion_role.name

  tags = {
    Project     = var.project
    Environment = var.environment
    Identifier  = "bastion"
    Name        = "${var.project}_${var.environment_short}_bastion"
  }
}

resource "aws_iam_role" "bastion_role" {
  name        = "${var.project}_${var.environment_short}_bastion"
  description = "Bastion role"

  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/AmazonSSMPatchAssociation",
  ]

  tags = {
    Project     = var.project
    Environment = var.environment
    Identifier  = "bastion"
    Name        = "${var.project}_${var.environment_short}_bastion"
  }
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = [
        "ec2.amazonaws.com"
      ]
    }
    actions = ["sts:AssumeRole"]
  }
}
