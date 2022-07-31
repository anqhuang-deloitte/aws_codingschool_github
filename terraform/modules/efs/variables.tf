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

variable "public_subnets" {
  description = "public subnets"
}

variable "private_subnets" {
  description = "private subnets"
}

variable "vpc_id" {
  description = "vpc id"
}
