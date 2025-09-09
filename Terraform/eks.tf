module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "${local.name}-cluster"
  cluster_version = local.cluster_version
  subnet_ids      = [aws_subnet.private1.id, aws_subnet.private2.id]
  vpc_id          = aws_vpc.main.id

  # Enable public endpoint access for kubectl from local machine
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t2.micro"
      capacity_type = "SPOT"
    }
  }
}
