resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public1.id

  tags = {
    Name = "${local.name}-nat"
  }
  depends_on = [aws_internet_gateway.igw]
}
resource "aws_eip" "nat" {

  tags = {
    Name = "${local.name}-nat-eip"
  }
}
