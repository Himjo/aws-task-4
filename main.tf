//AWS Provides
provider "aws" {
    region = "ap-south-1"
    profile = "goel"
}

module "aws_instance" {
    source = "./myaws"
    my_ec2_type = "t2.micro"
}
