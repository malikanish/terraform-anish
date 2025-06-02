
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
#   description = "Base CIDR block for VPC"
#   type        = string
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

# locals {
#   newbits     = 8
#   subnet_list = [for i in range(var.subnet_count) : cidrsubnet(var.base_cidr, local.newbits, i)]
#   public_subnets  = slice(local.subnet_list, 0, 10)
#   private_subnets = slice(local.subnet_list, 10, 20)
# }


# # variable "prefix"{
# #   type = object({
# #     name = anish
# #     env = dev

# #   })
# # }

# variable "prefix_name" {
#   type = string
  
# }
# variable "prefix_env" {
#   type = string
  
# }
  


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


# data "aws_availability_zone" "example" {
#   name = "us-east-1"
# }


# variable "availability_zone_a" {
#   type = string
# }

# variable "availability_zone_b" {
#   type = string
# }


# locals {
#   newbits     = 8
#   subnet_list = [for i in range(20) : cidrsubnet(var.base_cidr, local.newbits, i)]
#   public_subnet_count  = min(var.subnet_count, 10)
#   private_subnet_count = max(var.subnet_count - 10, 0)

#   public_subnets  = slice(local.subnet_list, 0, local.public_subnet_count)
#   private_subnets = slice(local.subnet_list, 10, 10 + local.private_subnet_count)
# }

# variable "availability_zones" {
#   description = "List of availability zones to distribute subnets across"
#   type        = list(string)
# }

# locals {
#   newbits         = 8
#   subnet_list     = [for i in range(var.subnet_count) : cidrsubnet(var.base_cidr, local.newbits, i)]
#   public_subnets  = slice(local.subnet_list, 0, 10)
#   private_subnets = slice(local.subnet_list, 10, 20)
# }


# locals {
#   newbits          = 8
#   half_count       = floor(var.subnet_count / 2)
#   subnet_list      = [for i in range(var.subnet_count) : cidrsubnet(var.base_cidr, local.newbits, i)]
#   public_subnets   = slice(local.subnet_list, 0, local.half_count)
#   private_subnets  = slice(local.subnet_list, local.half_count, var.subnet_count)
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
