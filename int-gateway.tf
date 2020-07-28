//Provides a resource to create a VPC Internet Gateway

resource "aws_internet_gateway" "myvpc_int_gw" {
  vpc_id = "${aws_vpc.myvpc.id}"

  tags = {
    Name = "myvpc_int_gw"
  }
}
