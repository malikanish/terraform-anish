
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



variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}


variable "igw_name" {
  type = string
}

variable "route_table_name" {
  type = string
}

variable "base_cidr" {
  description = "Base CIDR block for subnetting"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_count" {
  type        = number
  description = "Total number of subnets (public + private)"
  default     = 20

  validation {
    condition     = var.subnet_count == 20
    error_message = "Exactly 20 subnets required (10 public + 10 private)."
  }
}

variable "prefix_name" {
  type = string
}

variable "prefix_env" {
  type = string
}

locals {
  newbits     = 8
  subnet_list = [for i in range(var.subnet_count) : cidrsubnet(var.base_cidr, local.newbits, i)]
  public_subnets  = slice(local.subnet_list, 0, 10)
  private_subnets = slice(local.subnet_list, 10, 20)

  common_tags = {
    owner = var.prefix_name
    env   = var.prefix_env
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}



# variable "availability_zones" {
#   description = "List of availability zones to distribute subnets across"
#   type        = list(string)
# }

