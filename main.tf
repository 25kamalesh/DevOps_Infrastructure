provider "aws" {
  region     = var.Instance_region
}

variable "Instance_region" {
  type        = string
  default     = "us-east-1"
  description = "description"
}

variable "jenkins_instance_type" {}

variable "Nexus_Sona_instance_type" {}

resource "aws_instance" "jenkins" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = var.jenkins_instance_type
  security_groups = [aws_security_group.devops_infra_sg.name]
  key_name      = aws_key_pair.MY_LOGIN_KEY_DevOps.key_name
  tags = {
    Name = "jenkins-Server"
  }
}

resource "aws_instance" "sonarqube" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = var.Nexus_Sona_instance_type
  security_groups = [aws_security_group.devops_infra_sg.name]
  key_name      = aws_key_pair.MY_LOGIN_KEY_DevOps.key_name
  tags = {
    Name = "sonarqube-Server"
  }
}

resource "aws_instance" "nexus" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = var.Nexus_Sona_instance_type
  security_groups = [aws_security_group.devops_infra_sg.name]
  key_name      = aws_key_pair.MY_LOGIN_KEY_DevOps.key_name
  tags = {
    Name = "Nexus-Repo-Server"
  }
} 