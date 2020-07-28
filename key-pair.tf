//Generates a secure private key and encodes it as PEM

resource "tls_private_key" "jpy" {
  algorithm   = "RSA"
  rsa_bits = 4096
}

//Provides an EC2 key pair resource

resource "aws_key_pair" "instance_key" {
  key_name   = "securekey"
  public_key =  tls_private_key.jpy.public_key_openssh 

}

//Generates a local file with the given content

resource "local_file" "mykeyfile" {
    content     = tls_private_key.jpy.private_key_pem 
    filename =  "securekey.pem"
}