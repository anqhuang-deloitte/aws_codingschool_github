#Defining and declaring variables

variable "environment" {
  description = "Name of the application environment. e.g. dev, prod, test, staging"
  default     = "dev"
}

variable "prefix" {
  description = "Prefix for all the resources to be created. Please note thst 2 allows only lowercase alphanumeric characters and hyphen"
  default     = "wordpress"
}

variable "tags" {
  default = {

    Environment = "Dev"
    Owner       = "Deloitte"
    Project     = "DiveIn"

  }
}

variable "db_engine_version" {
  description = "The database engine version"
  default     = "5.6.10a"
}

variable "db_master_username" {
  description = "Master username of the db"
  default     = "Gandald"
}

variable "db_master_password" {
  description = "Master password of the db"
  default     = "safePassword"
}

variable "db_backup_retention_days" {
  description = "Number of days to retain db backups"
  default     = "1"
}

variable "db_backup_window" {
  description = "The daily time range during which automated backups for rds are created if automated backups are enabled using the BackupRetentionPeriod parameter. Time in UTC."
  default     = "07:00-09:00"
}

variable "db_max_capacity" {
  description = "The maximum Aurora capacity unit of the db. Ref - https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.how-it-works.html"
  default     = "1"
}
variable "db_min_capacity" {
  description = "The minimum Aurora capacity unit of the db. Ref - https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.how-it-works.html"
  default     = "1"
}

variable "db_auto_pause" {
  description = "Whether to enable auto pause"
  default     = true
}

variable "db_seconds_until_auto_pause" {
  description = "The time in seconds before Aurora DB is paused"
  default     = 300
}

variable "public_subnets" {
  description = "public subnets"
}

variable "private_subnets" {
  description = "private subnets"
}

variable "vpc_id" {
  description = "vpc id"
}

variable "azs" {
  description = "Availability zones"
}