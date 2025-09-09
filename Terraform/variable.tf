locals {
  region             = "eu-west-1"
  cidr_block         = "10.0.0.0/16"
  name               = "project1"
  availability_zone1 = "${local.region}a"
  availability_zone2 = "${local.region}b"
  cluster_version    = "1.33"
}
