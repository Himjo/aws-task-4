resource "aws_eip" "jp" {
  vpc      = true
}

resource "aws_nat_gateway" "gw_nat" {
  allocation_id = "${aws_eip.jp.id}"
  subnet_id     = "${aws_subnet.public_subnet.id}"
  depends_on    = [ "aws_internet_gateway.myvpc_int_gw" ]
}

resource "aws_route_table" "nat-rtable" {
  vpc_id = "${aws_vpc.myvpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.gw_nat.id}"
  }
  tags = {
    Name = "nat-routetable"
  }
}

