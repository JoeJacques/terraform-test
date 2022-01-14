data "aws_availability_zones" "zones" {}

resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name    = var.TechTest
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name    = var.TechTest
  }
}

resource "aws_eip" "ngw_ip" {}

resource "aws_nat_gateway" "ngw" {
  count         = var.private_subnets > 0 ? 1 : 0
  allocation_id = aws_eip.ngw_ip.id
  subnet_id     = aws_subnet.public_subnets.0.id
}
resource "aws_subnet" "public_subnets" {
  count                   = var.required_subnets > 0 ? var.required_subnets : 1
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 10 + count.index)
  availability_zone       = element(data.aws_availability_zones.zones.names, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name    = "${var.TechTest}-Public-${count.index}"
    Tier    = "Public"
    count   = count.index 
  }
}
resource "aws_subnet" "private_subnets" {
  count             = var.private_subnets
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 100 + count.index) # Used for future proofing so if more VPCs are created the will never have overlapping CIDR blocks. 
  availability_zone = element(data.aws_availability_zones.zones.names, count.index) # Used for High avalablity making sure all subnets are in a diffrent AZ 

  tags = {
    Name    = "${var.TechTest}-Private-${count.index}"
    Tier    = "private"
  }
}
