variable "public_subnets" {
  description = "public subnets"
}

variable "vpc_id" {
  description = "vpc id"
}

variable "tags" {
  default = {

    Environment = "Dev"
    Owner       = "Deloitte"
    Project     = "DiveIn"

  }
}