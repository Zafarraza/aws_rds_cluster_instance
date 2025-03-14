terraform {
  backend "http" {
  }
}

locals {
  rds_auto_minor_version_upgrade = true
  rds_cluster_engine             = "aurora-mysql"
  rds_cluster_engine_version     = "8.0.mysql_aurora.3.05.2"
  rds_cluster_instance_class     = "db.t4g.medium"
  rds_cluster_master_username    = ""
  rds_cluster_vpc_id             = "vpc-"
  rds_multi_az                   = true
  rds_subnet_ids                 = ["subnet-", "subnet-", "subnet-"]
  rds_skip_final_snapshot        = true
  tags = {
    "Business:Backup"         = false
    "Business:Severity"       = "Sev3"
    "Business:Team"           = "CLOUDOPS"
    "Created:By"              = "terraform"
    "Module:Test"             = true
    "Security:Classification" = "internal"
    "Security:Encryption"     = false
    "Technical:Environment"   = "dev"
    "Technical:RunBook"       = "https://atlassian.net/wiki/"
  }
}
