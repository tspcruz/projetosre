# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------
variable "environment" {
  description = "environment"
  type        = string   
  default = "hom"
}

# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------
variable "identifier" {
  description = "identifier"
  type        = string
}

variable "engine" {
  description = "engine"
  type        = string
}

variable "engine_version" {
  description = "engine_versionr"
  type        = string
}

variable "allocated_storage" {
  description = "allocated_storage"
  type        = string
}

variable "instance_class" {
  description = "instance_class"
  type        = string
}

variable "machinename" {
  description = "machinename"
  type        = string
}

#variable "db_name" {
#  description = "The name to use for the database"
#  type        = string
#}

variable "region" {
  description = "AWS region"
  default     = "sa-east-1"
  type        = string
}

variable "password" {
  description = "RDS root user password"
  type        = string
}

variable "username" {
  description = "RDS root user name"
  type        = string
}