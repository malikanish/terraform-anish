# ##VPC_START###
# resource "aws_vpc" "demo_vpc" {
#   cidr_block = var.vpc_cidr_block
  
# tags = {
#   Name = "vpc-${var.prefix_name}-${var.prefix_env}"
#   env  = var.prefix_env
# }
# }

# ##VPC_END###


# ##PublicSubnet_START###
# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.demo_vpc.id

#   tags = {
#     Name = var.igw_name
#   }
# }

# resource "aws_route_table" "public_rtb" {
#   vpc_id = aws_vpc.demo_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }

#   tags = {
#     Name = var.route_table_name
#   }
# }

# resource "aws_subnet" "public_subnets" {
#   count             = 10
#   vpc_id            = aws_vpc.demo_vpc.id
#   cidr_block        = local.public_subnets[count.index]
#   availability_zone = var.availability_zone_a
#   map_public_ip_on_launch = true

#   tags = {
#     Name    = "Public-Subnet-dev-${count.index + 1}"
#     Purpose = "Public"
#   }
# }

# resource "aws_route_table_association" "public_subnet_associations" {
#   count          = 10
#   subnet_id      = aws_subnet.public_subnets[count.index].id
#   route_table_id = aws_route_table.public_rtb.id
# }


# ##PublicSubnet_END###

# ##PrivateSubnet_START###

# resource "aws_subnet" "private_subnets" {
#   count             = 10
#   vpc_id            = aws_vpc.demo_vpc.id
#   cidr_block        = local.private_subnets[count.index]
#   availability_zone = var.availability_zone_b

#   tags = {
#     Name    = "Private-Subnet- ${count.index + 1}"
#     Purpose = "Private"
#   }
# }
# ##PrivateSubnet_END###



# resource "aws_subnet" "public_subnets" {
#   count                   = 10
#   vpc_id                  = aws_vpc.demo_vpc.id
#   cidr_block              = local.public_subnets[count.index]
#   availability_zone       = element(var.availability_zones, count.index % length(var.availability_zones))
#   map_public_ip_on_launch = true

#   tags = merge(local.common_tags, {
#     Name    = "public-subnet-${var.prefix_name}-${var.prefix_env}-${count.index + 1}"
#     Purpose = "public"
#   })
# }

# resource "aws_subnet" "private_subnets" {
#   count             = 10
#   vpc_id            = aws_vpc.demo_vpc.id
#   cidr_block        = local.private_subnets[count.index]
#   availability_zone = element(var.availability_zones, count.index % length(var.availability_zones))

#   tags = merge(local.common_tags, {
#     Name    = "private-subnet-${var.prefix_name}-${var.prefix_env}-${count.index + 1}"
#     Purpose = "private"
#   })
# }




# resource "aws_subnet" "private_subnets" {
#   count             = 10
#   vpc_id            = aws_vpc.demo_vpc.id
#   cidr_block        = local.private_subnets[count.index]
#   availability_zone = var.availability_zone_b

#   tags = merge(local.common_tags, {
#     Name    = "private-subnet-${var.prefix_name}-${var.prefix_env}-${count.index + 1}"
#     Purpose = "private"
#   })
# }

# resource "aws_subnet" "public_subnets" {
#   count                   = 10
#   vpc_id                  = aws_vpc.demo_vpc.id
#   cidr_block              = local.public_subnets[count.index]
#   availability_zone       = var.availability_zone_a
#   map_public_ip_on_launch = true

#   tags = merge(local.common_tags, {
#     Name    = "public-subnet-${var.prefix_name}-${var.prefix_env}-${count.index + 1}"
#     Purpose = "public"
#   })
# }



# resource "aws_subnet" "public_subnets" {
#   count                   = var.subnet_count
#   vpc_id                  = aws_vpc.anish_vpc.id
#   cidr_block              = local.public_subnets[count.index]
#   availability_zone       = element(data.aws_availability_zones.available.names, count.index % length(data.aws_availability_zones.available.names))
#   map_public_ip_on_launch = true

#   tags = {
#     Name    = "${var.prefix_name}-${var.public_subnet_name}-${count.index + 1}-${var.prefix_env}"
#   }
# }

# resource "aws_subnet" "private_subnets" {
#   count             = var.subnet_count
#   vpc_id            = aws_vpc.anish_vpc.id
#   cidr_block        = local.private_subnets[count.index]
#   availability_zone = element(data.aws_availability_zones.available.names, count.index % length(data.aws_availability_zones.available.names))

#   tags = {
#     Name    = "${var.prefix_name}-${var.private_subnet_name}-${count.index + 1}-${var.prefix_env}"
#   }
# }

# resource "aws_route_table_association" "public_subnet_associations" {
#   count          = var.subnet_count
#   subnet_id      = aws_subnet.public_subnets[count.index].id
#   route_table_id = aws_route_table.public_rtb.id

  
# }

### VPC-START ###

resource "aws_vpc" "anish_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name  = "${var.prefix_name}-${var.vpc_name}-${var.prefix_env}"
  }
}

### VPC-END ###

### VPC-igw ###

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.anish_vpc.id

  tags = {
    Name  = "${var.prefix_name}-${var.igw_name}-${var.prefix_env}"
  }
}

### VPC-igw-END ###

### VPC-route-table ###

resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.anish_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name  = "${var.prefix_name}-${var.route_table_name}-${var.prefix_env}"
  }
}

resource "aws_route_table_association" "public_subnet_associations" {
  count          = local.public_count
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_rtb.id
}


### VPC-route-table END ###

### VPC-subnets start ###
resource "aws_subnet" "public_subnets" {
  count                   = local.public_count
  vpc_id                  = aws_vpc.anish_vpc.id
  cidr_block              = local.public_subnets[count.index]
  availability_zone       = element(data.aws_availability_zones.available.names, count.index % length(data.aws_availability_zones.available.names))
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.prefix_name}-${var.public_subnet_name}-${count.index + 1}-${var.prefix_env}"
  }
}

resource "aws_subnet" "private_subnets" {
  count             = local.private_count
  vpc_id            = aws_vpc.anish_vpc.id
  cidr_block        = local.private_subnets[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index % length(data.aws_availability_zones.available.names))

  tags = {
    Name = "${var.prefix_name}-${var.private_subnet_name}-${count.index + 1}-${var.prefix_env}"
  }
}
### VPC-subnets END###


