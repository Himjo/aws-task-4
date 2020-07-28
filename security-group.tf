//Provides a security group resource

resource "aws_security_group" "sg1" {
  name        = "sg1"
  description = "Creating firewall for WordPress OS to Allow inbound traffic"
  vpc_id      = "${aws_vpc.myvpc.id}"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg1"
  }
}

//Provides a security group resource

resource "aws_security_group" "sg2" {
  name        = "sg2"
  description = "Creating firewall for MySQL OS to Allow inbound traffic for BastionOS only"
  vpc_id      = "${aws_vpc.myvpc.id}"

  ingress {
    description = "Allow SQL from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.myvpc.cidr_block]
  }
  
  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg2"
  }
}

//Provides a security group resource

resource "aws_security_group" "sg3" {
  name        = "sg3"
  description = "Creating firewall for Bastion OS to Allow SSH for Bastion"
  vpc_id      = "${aws_vpc.myvpc.id}"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg3"
  }
}