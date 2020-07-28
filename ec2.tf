variable "my_ec2_type" {}

//Provides an EC2 instance resource

resource "aws_instance" "wordpress_os" {
  ami           = "ami-091d1a4bf6c89105c"
  instance_type = var.my_ec2_type
  key_name =  aws_key_pair.instance_key.key_name
  availability_zone="ap-south-1a"
  vpc_security_group_ids = [ aws_security_group.sg1.id ]
  subnet_id = aws_subnet.public_subnet.id

  tags = {
    Name = "wordpress_os"
  }
}

//Provides an EC2 instance resource

resource "aws_instance" "mysql_os" {
  ami           = "ami-0eb1f627a6da6712b"
  instance_type = var.my_ec2_type
  key_name =  aws_key_pair.instance_key.key_name
  associate_public_ip_address = true 
  availability_zone="ap-south-1b"
  vpc_security_group_ids = [ aws_security_group.sg2.id ]
  subnet_id =  aws_subnet.private_subnet.id
  tags = {
    Name = "mysql_os"
  }
}

//Provides an EC2 instance resource

resource "aws_instance" "bastion" {
  ami           = "ami-0732b62d310b80e97"
  instance_type = var.my_ec2_type
  key_name =  aws_key_pair.instance_key.key_name
  availability_zone="ap-south-1a"
  vpc_security_group_ids = [ aws_security_group.sg3.id ]
  subnet_id =  aws_subnet.public_subnet.id
  tags = {
    Name = "bastion_os"
  }
}

/*
resource "null_resource" "save_key_pair"  {
	provisioner "local-exec" {
	    command = "echo  '${tls_private_key.instance_key.private_key_pem}' > key.pem"
  	}
}
*/