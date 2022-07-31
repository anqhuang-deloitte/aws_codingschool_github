module "backend_resources" {
  source = "./src/backend_remote"
}

module "vpc" {
  source = "./src/modules/vpc"
}


module "fargate" {
  source                               = "./src/modules/Fargate"
  vpc_id                               = module.vpc.vpc_id
  private_subnets                      = module.vpc.private_subnets
  public_subnets                       = module.vpc.public_subnets
  aws_security_group_efs_id            = module.efs.aws_security_group_efs_id
  aws_ssm_parameter_db_master_password = module.database.aws_ssm_parameter_db_master_password
  aws_ssm_parameter_db_master_user     = module.database.aws_ssm_parameter_db_master_user
  aws_rds_cluster_endpoint             = module.database.aws_rds_cluster_endpoint
  aws_efs_file_system_id               = module.efs.aws_efs_file_system_id
  aws_security_group_db_id             = module.database.aws_security_group_db_id
  sg_foo                               = module.vpc.sg_foo
  aws_alb_target_group_arn             = module.alb.aws_alb_target_group_arn
  aws_security_group_alb_id            = module.alb.aws_security_group_alb_id
}


module "database" {
  source          = "./src/modules/database"
  public_subnets  = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id
  azs             = module.vpc.azs
}

module "efs" {
  source          = "./src/modules/efs"
  public_subnets  = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id
}

module "alb" {
  depends_on = [
    module.vpc.vpc_id
  ]
  source         = "./src/modules/alb"
  public_subnets = module.vpc.public_subnets
  vpc_id         = module.vpc.vpc_id
}
