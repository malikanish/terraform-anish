module "vpc" {
  source              = "../../modules/vpc"
  prefix_name         = var.prefix_name
  prefix_env          = var.prefix_env
  vpc_cidr_block      = var.vpc_cidr_block
  igw_name            = var.igw_name
  route_table_name    = var.route_table_name
  base_cidr           = var.base_cidr
  subnet_count        = var.subnet_count
  # availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
  # availability_zone_a = var.availability_zone_a
  # availability_zone_b = var.availability_zone_b
}


