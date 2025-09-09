resource "aws_subnet" "private1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = false
  availability_zone       = local.availability_zone1

  tags = {
    Name                     = "${local.name}-private-subnet-1"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = false
  availability_zone       = local.availability_zone2

  tags = {
    Name                              = "${local.name}-private-subnet-2"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = local.availability_zone1

  tags = {
    Name                     = "${local.name}-public-subnet-1"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone       = local.availability_zone2

  tags = {
    Name                     = "${local.name}-public-subnet-2"
    "kubernetes.io/role/elb" = "1"
  }
}
