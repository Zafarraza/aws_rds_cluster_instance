output "rds_cluster_arn" {
  description = "value of the RDS cluster arn"
  value       = aws_rds_cluster.this.arn
}

output "rds_cluster_endpoint" {
  description = "value of the RDS cluster endpoint"
  value       = aws_rds_cluster.this.endpoint
}

output "rds_cluster_id" {
  description = "value of the RDS cluster id"
  value       = aws_rds_cluster.this.id
}

output "rds_cluster_identifier" {
  description = "value of the RDS cluster identifier"
  value       = aws_rds_cluster.this.cluster_identifier
}

output "rds_cluster_resource_id" {
  description = "value of the RDS cluster resource id"
  value       = aws_rds_cluster.this.cluster_resource_id
}

output "security_group_id" {
  value = module.aws_security_group.security_group_id
}
