//Provides a VPC resource

resource "aws_vpc" "myvpc" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "myvpc"
  }
}

//Provides an VPC subnet resource

resource "aws_subnet" "public_subnet" {
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "192.168.1.0/24"
  availability_zone="ap-south-1a"
  map_public_ip_on_launch = "true" 

  tags = {
    Name = "public_subnet"
  }
}

//Provides an VPC subnet resource

resource "aws_subnet" "private_subnet" {
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "192.168.0.0/24"
  availability_zone="ap-south-1b"
  //map_public_ip_on_launch = "true" 

  tags = {
    Name = "private_subnet"
  }
}