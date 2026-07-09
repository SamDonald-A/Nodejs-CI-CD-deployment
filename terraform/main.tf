resource "aws_security_group" "ssh" {
  name = "sam-backend"

  # SSH
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS (optional but recommended)
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
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
    Name = "terraform-security-group"
  }
}

resource "aws_instance" "server" {

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ssh.id]

  tags = {
    Name = "Ansible-Remote-State"
  }
}

#resource "local_file" "ansible_inventory" {
#  filename = "../ansible/inventory.ini"
#
#  content = templatefile("${path.module}/inventory.tpl", {
#    public_ip  = aws_instance.server.public_ip
#    private_key = "~/.ssh/test.pem"
#  })
#}