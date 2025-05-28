resource "aws_security_group" "devops_infra_sg" {
  name        = "DevOps_infra_sg"
  description = "Allow HTTP, SSH, SonarQube, Jenkins, Nexus"

  ingress = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow SSH access"
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false
    },
    {
      from_port   = 8080
      to_port     = 8082
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow Jenkins and Nexus"
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false
    },
    {
      from_port   = 9000
      to_port     = 9000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow SonarQube"
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}