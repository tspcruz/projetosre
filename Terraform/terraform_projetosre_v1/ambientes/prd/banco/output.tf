# aws_db_subnet_group
/* output "db_subnet_group_name" {
  description = "The db subnet group name"
  value       = aws_db_instance.dbinstance.db_subnet_group_name
} */
/* 
# aws_rds_cluster
output "cluster_arn" {
  description = "Amazon Resource Name (ARN) of cluster"
  value       = aws_db_instance.dbinstance.cluster_arn
}

output "cluster_id" {
  description = "The RDS Cluster Identifier"
  value       = aws_db_instance.dbinstance.cluster_id
}

output "cluster_resource_id" {
  description = "The RDS Cluster Resource ID"
  value       = aws_db_instance.dbinstance.cluster_resource_id
}

output "cluster_members" {
  description = "List of RDS Instances that are a part of this cluster"
  value       = aws_db_instance.dbinstance.cluster_members
}

output "cluster_endpoint" {
  description = "Writer endpoint for the cluster"
  value       = aws_db_instance.dbinstance.cluster_endpoint
}

output "cluster_reader_endpoint" {
  description = "A read-only endpoint for the cluster, automatically load-balanced across replicas"
  value       = aws_db_instance.dbinstance.cluster_reader_endpoint
}

output "cluster_engine_version_actual" {
  description = "The running version of the cluster database"
  value       = aws_db_instance.dbinstance.cluster_engine_version_actual
} */

/* # database_name is not set on `aws_rds_cluster` resource if it was not specified, so can't be used in output
output "cluster_database_name" {
  description = "Name for an automatically created database on cluster creation"
  value       = aws_db_instance.dbinstance.cluster_database_name
}

output "cluster_port" {
  description = "The database port"
  value       = aws_db_instance.dbinstance.cluster_port
}

output "cluster_master_password" {
  description = "The database master password"
  value       = aws_db_instance.dbinstance.cluster_master_password
  sensitive   = true
}

output "cluster_master_username" {
  description = "The database master username"
  value       = aws_db_instance.dbinstance.cluster_master_username
  sensitive   = true
}

output "cluster_hosted_zone_id" {
  description = "The Route53 Hosted Zone ID of the endpoint"
  value       = aws_db_instance.dbinstance.cluster_hosted_zone_id
}

# aws_rds_cluster_instances
output "cluster_instances" {
  description = "A map of cluster instances and their attributes"
  value       = aws_db_instance.dbinstance.cluster_instances
}

# aws_rds_cluster_endpoint
output "additional_cluster_endpoints" {
  description = "A map of additional cluster endpoints and their attributes"
  value       = aws_db_instance.dbinstance.additional_cluster_endpoints
}

# aws_rds_cluster_role_association
output "cluster_role_associations" {
  description = "A map of IAM roles associated with the cluster and their attributes"
  value       = aws_db_instance.dbinstance.cluster_role_associations
} */

/* # Enhanced monitoring role
output "enhanced_monitoring_iam_role_name" {
  description = "The name of the enhanced monitoring role"
  value       = aws_db_instance.dbinstance.enhanced_monitoring_iam_role_name
}

output "enhanced_monitoring_iam_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the enhanced monitoring role"
  value       = aws_db_instance.dbinstance.enhanced_monitoring_iam_role_arn
}

output "enhanced_monitoring_iam_role_unique_id" {
  description = "Stable and unique string identifying the enhanced monitoring role"
  value       = aws_db_instance.dbinstance.enhanced_monitoring_iam_role_unique_id
}

# aws_security_group
output "security_group_id" {
  description = "The security group ID of the cluster"
  value       = aws_db_instance.dbinstance.security_group_id
} */

################################################################################
# Parameter Group
################################################################################

/* output "db_cluster_parameter_group_arn" {
  description = "The ARN of the DB cluster parameter group created"
  value       = aws_db_instance.dbinstance.db_cluster_parameter_group_arn
}

output "db_cluster_parameter_group_id" {
  description = "The ID of the DB cluster parameter group created"
  value       = aws_db_instance.dbinstance.db_cluster_parameter_group_id
} */

/* output "db_parameter_group_arn" {
  description = "The ARN of the DB parameter group created"
  value       = aws_db_instance.dbinstance.db_parameter_group_arn
}

output "db_parameter_group_id" {
  description = "The ID of the DB parameter group created"
  value       = aws_db_instance.dbinstance.db_parameter_group_id
} */

/* output "rds_hostname" {
  description = "RDS instance hostname"
  value       = module.database
  /* sensitive   = true */


output "rds_dbname" {
  description = "RDS instance dbname"
  value       = module.database.rds_dbname
  sensitive   = false
}
output "rds_endpoint" {
  value = module.database.aws_db_instance.default.endpoint
}
