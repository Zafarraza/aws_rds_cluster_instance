# Aurora MySQL RDS Module

This module creates an Amazon Aurora MySQL RDS cluster with associated resources. It sets up a database cluster, instances, subnet group, and security group with customizable parameters.

## Resources Created

| Resource | Description | Documentation |
|----------|-------------|---------------|
| aws_db_subnet_group | Subnet group for RDS | [AWS Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) |
| aws_rds_cluster | RDS Aurora cluster | [AWS Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) 
| aws_rds_cluster_instance | RDS cluster instances | [AWS Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance) |
| aws_security_group | Security group for RDS | [AWS Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) |

## Input Variables

| Variable Name | Required | Description |
|---------------|----------|-------------|
| rds_auto_minor_version_upgrade | No | Enable auto minor version upgrades |
| rds_cluster_allocated_storage | Yes | Allocated storage for the RDS cluster |
| rds_cluster_backup_retention_period | Yes | Backup retention period in days |
| rds_cluster_backup_window | Yes | Preferred backup window |
| rds_cluster_database_name | Yes | Name of the database to create |
| rds_cluster_engine | Yes | Database engine for the RDS cluster |
| rds_cluster_engine_version | Yes | Version of the database engine |
| rds_cluster_instance_class | Yes | Instance class for RDS instances |
| rds_cluster_instance_count | Yes | Number of RDS instances in the cluster 
| rds_cluster_maintenance_window | Yes | Preferred maintenance window |
| rds_cluster_master_username | Yes | Master username for the database |
| rds_cluster_storage_type | Yes | Storage type for the RDS cluster |
| rds_cluster_vpc_id | Yes | VPC ID where the RDS cluster will be created |
| rds_final_snapshot_identifier | No | The name of your final DB snapshot when this DB cluster is deleted |
| rds_skip_final_snapshot | No | Whether to skip final snapshot on deletion |
| rds_snapshot_identifier | No | Snapshot identifier for restoring from snapshot |
| rds_subnet_ids | Yes | List of subnet IDs for the RDS cluster |
| tags | Yes | A map of tags to add to all resources |

## Outputs

This module does not explicitly define any outputs in the provided code snippet.

## Example Usage

```hcl
module "aurora_mysql" {
  source = "path/to/module"
  
  rds_auto_minor_version_upgrade = true
  rds_cluster_allocated_storage  = 100
  rds_cluster_backup_retention_period = 7
  rds_cluster_backup_window      = "03:00-04:00"
  rds_cluster_database_name      = "mydb"
  rds_cluster_engine             = "aurora-mysql"
  rds_cluster_engine_version     = "5.7.12" 
  rds_cluster_instance_count     = 2
  rds_cluster_instance_class     = "db.r5.large"
  rds_cluster_maintenance_window = "sun:04:00-sun:05:00"
  rds_cluster_master_username    = "admin"
  rds_cluster_storage_type       = "aurora"
  rds_cluster_vpc_id             = "vpc-12345678"
  rds_final_snapshot_identifier  = "my-final-snapshot"
  rds_skip_final_snapshot        = false
  rds_subnet_ids                 = ["subnet-12345678", "subnet-87654321"]
  tags = {
    "Business:Team"          = "MyTeam"
    "Technical:Environment"  = "Production"
  }
}
