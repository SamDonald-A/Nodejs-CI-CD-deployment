resource "aws_security_group" "ssh" {
  name = "terraform-ssh"

  ingress {
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
}

resource "aws_instance" "server" {

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ssh.id]

  tags = {
    Name = "Ansible-Server"
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