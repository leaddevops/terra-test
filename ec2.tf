provider "aws" {

}

resource "aws_instance" "test-instances" {
  ami  = "ami-0747bdcabd34c712a"
  count = "2"
  instance_type = "t2.micro"
  key_name = "du-devops"
  user_data = <<-EOF
                #! /bin/bash
                sudo apt-get update
                sudo git clone http://github.com/lerndevops/labs
                sudo chmod -R 775 labs
                sudo labs/cloud/setup-user.sh
        EOF

  tags = {
    Name = "test${count.index + 1}"
    training = "devops"
  }
}
