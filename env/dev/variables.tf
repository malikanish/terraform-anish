# # variable "public_subnet_cidr_a" {
# #   type = string
# # }

# # variable "public_subnet_cidr_b" {
# #   type = string
# # }

# # variable "private_subnet_cidr" {
# #   type = string
# # }
# # variable "public_subnet_name_a" {
# #   type = string
# # }

# # variable "public_subnet_name_b" {
# #   type = string
# # }

# # variable "private_subnet_name" {
# #   type = string
# # }



# variable "vpc_cidr_block" {
#   description = "CIDR block for the VPC"
#   type        = string
# }

# variable "aws_vpc_name" {
#   type = string
# }



# variable "availability_zone_a" {
#   type = string
# }

# variable "availability_zone_b" {
#   type = string
# }



# variable "igw_name" {
#   type = string
# }

# variable "route_table_name" {
#   type = string
# }

# variable "base_cidr" {
#   type        = string
#   description = "Base network CIDR block"
#   default     = "10.0.0.0/16"
# }

# variable "subnet_count" {
#   type        = number
#   description = "Total number of subnets to create (must be 20)"
#   default     = 20

#   validation {
#     condition     = var.subnet_count == 20
#     error_message = "You must define exactly 20 subnets (10 public + 10 private)."
#   }
# }

# variable "availability_zone_a" {
#   type = string
# }

# variable "availability_zone_b" {
#   type = string
# }




variable "vpc_cidr_block" {}

variable "igw_name"{}

variable "route_table_name" {}

variable "base_cidr" {}

variable "subnet_count" {}

locals {
  newbits            = 8
  subnet_list        = [for i in range(var.subnet_count) : cidrsubnet(var.base_cidr, local.newbits, i)]
  public_count       = var.subnet_count / 2
  private_count      = var.subnet_count / 2
  public_subnets     = slice(local.subnet_list, 0, local.public_count)
  private_subnets    = slice(local.subnet_list, local.public_count, var.subnet_count)
}
variable "prefix_name" {}
variable "prefix_env" {}
variable "vpc_name" {}
variable "public_subnet_name" {}
variable "private_subnet_name" {}
data "aws_availability_zones" "available" {
  state = "available"
}