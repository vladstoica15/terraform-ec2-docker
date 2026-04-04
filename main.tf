resource "aws_key_pair" "devops_key" {
  key_name   = "devops-terraform-key"
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "devops_sg" {
  name = "devops-terraform-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    from_port   = 80
    to_port     = 80
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

resource "aws_instance" "devops_server" {
  ami                    = "ami-08eb150f611ca277f"
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.devops_key.key_name
  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  user_data = file("user_data.sh")

  tags = {
    Name = "devops-terraform-lab"
  }
}
