//Provides a resource to create a VPC routing table

resource "aws_route_table" "my_gw_route" {
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.myvpc_int_gw.id}"
  }

  tags = {
    Name = "my_gw_route"
  }
}