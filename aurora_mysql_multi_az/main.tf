module "security_group" {
  source                    = "./modules/security_group"
  project                   = var.project
  environment               = var.environment
  environment_short         = var.environment_short
  vpc_id                    = data.terraform_remote_state.remote_state.outputs.export.vpc_id
  bastion_security_group_id = data.terraform_remote_state.remote_state.outputs.export.bastion_security_group_id
}

module "subnet_group" {
  source             = "./modules/rds/subnet_group"
  project            = var.project
  environment        = var.environment
  environment_short  = var.environment_short
  vpc_id             = data.terraform_remote_state.remote_state.outputs.export.vpc_id
  cidr_block         = data.terraform_remote_state.remote_state.outputs.export.vpc_cidr_block
  availability_zones = data.terraform_remote_state.remote_state.outputs.export.availability_zones
}

module "monitoring_role" {
  source            = "./modules/role"
  project           = var.project
  environment       = var.environment
  environment_short = var.environment_short
}

locals {
  instance_class = "db.t3.medium"
}

module "cluster" {
  source               = "./modules/rds/cluster"
  project              = var.project
  environment          = var.environment
  environment_short    = var.environment_short
  availability_zones   = data.terraform_remote_state.remote_state.outputs.export.availability_zones
  db_subnet_group_name = module.subnet_group.name
  master_password      = var.master_password
  security_group_id    = module.security_group.id
}

module "instance" {
  source               = "./modules/rds/instance"
  project              = var.project
  environment          = var.environment
  environment_short    = var.environment_short
  availability_zones   = data.terraform_remote_state.remote_state.outputs.export.availability_zones
  cluster_id           = module.cluster.id
  engine_config        = module.cluster.engine_config
  instance_class       = local.instance_class
  db_subnet_group_name = module.subnet_group.name
  monitoring_role_arn  = module.monitoring_role.arn
}
