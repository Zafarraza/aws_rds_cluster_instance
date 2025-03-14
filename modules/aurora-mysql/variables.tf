##############################
##### Required Input Variables
##############################

variable "rds_cluster_database_name" {
  description = "The DB name to create."
  type        = string
}

variable "rds_cluster_engine" {
  description = "The database engine to use."
  type        = string
}

variable "rds_cluster_engine_version" {
  description = "The engine version to use."
  type        = string
}

variable "rds_cluster_vpc_id" {
  description = "The VPC ID."
  type        = string
}

variable "rds_subnet_ids" {
  description = "List of VPC subnet IDs."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to add to the SNS topic"
  type        = map(string)
}

##############################
##### Optional Input Variables
##############################

variable "rds_auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window."
  type        = bool
  default     = true
}

variable "rds_cluster_allocated_storage" {
  description = "The allocated storage in gibibytes."
  type        = number
  default     = null
}

variable "rds_cluster_backup_retention_period" {
  description = "The days to retain backups for."
  type        = number
  default     = 5
}

variable "rds_cluster_backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled."
  type        = string
  default     = "03:30-06:00"
}

variable "rds_cluster_instance_class" {
  description = "The instance type of the Cluster."
  type        = string
  default     = "db.t4g.medium"
}

variable "rds_cluster_instance_count" {
  description = "The number of DB instances in the cluster."
  type        = number
  default     = 2
}

variable "rds_cluster_maintenance_window" {
  description = "The window to perform maintenance in UTC."
  type        = string
  default     = "Wed:14:00-Wed:15:00"
}

variable "rds_cluster_master_username" {
  description = "The master username for the database."
  type        = string
  default     = "admin"
}

variable "rds_cluster_storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted."
  type        = bool
  default     = true
}

variable "rds_cluster_storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD)."
  type        = string
  default     = null
}

variable "rds_final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this resource is destroyed."
  type        = string
  default     = null
}

variable "rds_multi_az" {
  description = "Specifies if the RDS instance is multi-AZ."
  type        = bool
  default     = true
}

variable "rds_skip_final_snapshot" {
  description = "Determines whether a final snapshot is created before the cluster is deleted."
  type        = bool
  default     = false
}

variable "rds_snapshot_identifier" {
  description = "The snapshot ID you want to use to restore a new database from"
  type        = string
  default     = null
}

