provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "web_sg" {
  name        = "web-server-sg"
  description = "Allow HTTP, HTTPS, SSH and ICMP"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ips
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_ips
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.allowed_ips
  }

  ingress {
    description = "Allow ICMP (ping)"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = var.allowed_ips
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-server-sg"
  }
}

resource "aws_instance" "server" {
  count         = 2
  ami           = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = var.key_name

  tags = {
    Name = "server-${count.index + 1}"
  }
}
