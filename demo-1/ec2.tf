resource "aws_instance" "default" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.default.id]
  iam_instance_profile   = aws_iam_instance_profile.default.id

  tags = {
    Name = "demo-1-ec2"
  }
}

resource "aws_eip" "default" {
  instance = aws_instance.default.id
  vpc      = true
}


