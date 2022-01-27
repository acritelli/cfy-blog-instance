resource "aws_security_group" "allow_ssh" {
  name        = "${var.instance_name}-allow-ssh"
  description = "Allow inbound SSH"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_instance" "instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  associate_public_ip_address = true
  security_groups             = aws_security_group.allow_ssh.*.name

  key_name = var.ssh_keypair

  tags = {
    Name = var.instance_name
  }
}
