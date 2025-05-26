resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/deployer.pub")
}

resource "aws_instance" "jenkins_master" {
  ami           = "ami-0c02fb55956c7d316" # Ubuntu 22.04 (check region)
  instance_type = var.aws_instance_type.id
  key_name      = aws_key_pair.deployer.key_name

  tags = {
    Name = "Jenkins-Master"
  }
}

resource "aws_instance" "jenkins_slave" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = var.aws_ami_id
  key_name      = aws_key_pair.deployer.key_name

  tags = {
    Name = "Jenkins-Slave"
  }
}
