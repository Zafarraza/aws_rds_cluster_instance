locals {
  name = "auroramysql"
}

data "aws_db_cluster_snapshot" "test_snapshot" {
  db_cluster_identifier = "cloudops-dev-rds-cluster"
  most_recent           = true
}

# Creates an rds cluster with instance
module "aws_rds_cluster_from_snapshot" {
  source = "../modules/aurora-mysql"

  rds_auto_minor_version_upgrade = local.rds_auto_minor_version_upgrade
  rds_cluster_database_name      = local.name
  rds_cluster_engine             = local.rds_cluster_engine
  rds_cluster_engine_version     = local.rds_cluster_engine_version
  rds_cluster_instance_class     = local.rds_cluster_instance_class
  rds_cluster_master_username    = local.rds_cluster_master_username
  rds_cluster_vpc_id             = local.rds_cluster_vpc_id
  rds_multi_az                   = local.rds_multi_az
  rds_skip_final_snapshot        = local.rds_skip_final_snapshot
  rds_subnet_ids                 = local.rds_subnet_ids
  rds_snapshot_identifier        = data.aws_db_cluster_snapshot.test_snapshot.id
  tags = merge(
    local.tags,
    {
      "Application:Name"  = local.name
      "Technical:GitRepo" = ""
    }
  )
}
