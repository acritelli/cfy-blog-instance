# A random suffix is used for resources to prevent any naming collisions
resource "random_id" "suffix" {
    byte_length = 4
}

resource "aws_security_group" "allow_ssh_and_http" {
  name        = "${var.instance_name}-${random_id.suffix.hex}"
  description = "Allow inbound SSH"

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
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
}

resource "aws_instance" "instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  associate_public_ip_address = true
  security_groups             = aws_security_group.allow_ssh_and_http.*.name

  key_name = var.ssh_keypair

  tags = {
    Name = "${var.instance_name}-${random_id.suffix.hex}"
  }
}
