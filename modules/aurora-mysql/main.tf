# locals is a module that creates common local variables for all resources
locals {
  description               = "Security group for ${local.naming_prefix}-rds-${var.rds_cluster_database_name}"
  naming_prefix             = "${lower(var.tags["Business:Team"])}-${var.tags["Technical:Environment"]}"
  rds_cluster_full_name     = "${local.naming_prefix}-rds-cluster-${var.rds_cluster_database_name}"
  rds_instance_full_name    = "${local.naming_prefix}-rds-instance-${var.rds_cluster_database_name}"
  sg_full_name              = "${local.naming_prefix}-sg-${var.rds_cluster_database_name}"
  db_subnet_group_full_name = "${local.naming_prefix}-db-subnet-group-${var.rds_cluster_database_name}"
}

# Creates an RDS instance
resource "aws_rds_cluster_instance" "this" {
  count                      = var.rds_cluster_instance_count
  identifier                 = "${local.rds_instance_full_name}-${count.index}"
  cluster_identifier         = aws_rds_cluster.this.id
  instance_class             = var.rds_cluster_instance_class
  engine                     = var.rds_cluster_engine
  engine_version             = var.rds_cluster_engine_version
  db_subnet_group_name       = aws_db_subnet_group.this.name
  auto_minor_version_upgrade = var.rds_auto_minor_version_upgrade
  tags = merge(
    var.tags,
    {
      "Name" = "${local.rds_instance_full_name}-${count.index}"
    }
  )
}

resource "aws_db_subnet_group" "this" {
  name       = local.db_subnet_group_full_name
  subnet_ids = var.rds_subnet_ids

  tags = merge(
    var.tags,
    {
      Name = local.db_subnet_group_full_name
    }
  )
}

# Creates an RDS cluster
resource "aws_rds_cluster" "this" {
  allocated_storage            = var.rds_cluster_allocated_storage
  backup_retention_period      = var.rds_cluster_backup_retention_period
  cluster_identifier           = local.rds_cluster_full_name
  database_name                = var.rds_cluster_database_name
  db_subnet_group_name         = aws_db_subnet_group.this.name
  engine                       = var.rds_cluster_engine
  engine_version               = var.rds_cluster_engine_version
  final_snapshot_identifier    = var.rds_final_snapshot_identifier
  master_username              = var.rds_cluster_master_username
  manage_master_user_password  = true
  preferred_backup_window      = var.rds_cluster_backup_window
  preferred_maintenance_window = var.rds_cluster_maintenance_window
  skip_final_snapshot          = var.rds_skip_final_snapshot
  storage_encrypted            = true
  storage_type                 = var.rds_cluster_storage_type
  snapshot_identifier          = var.rds_snapshot_identifier
  tags = merge(
    var.tags,
    {
      "Name" = local.rds_cluster_full_name
    }
  )
  vpc_security_group_ids = [module.aws_security_group.security_group_id]
}

# Creates a security group for the RDS cluster
module "aws_security_group" {
  source  = "security-group/aws"
  version = "0.0.1"

  description = local.description
  name        = var.rds_cluster_database_name
  vpc_id      = var.rds_cluster_vpc_id
  tags = merge(
    var.tags
  )
}

# module "tags" is a module that creates common tags for all resources
module "tags" {
  source  = "basic-tags/aws"
  version = "0.1.0"

  tags = merge(
    var.tags,
    {
      "Application:Name"    = var.rds_cluster_database_name
      "Business:Backup"     = false
      "Security:Encryption" = false
    }
  )
}

