terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "AKIAXP3SB3J4VJUBIHGQ"
  secret_key = "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"
}

resource "aws_instance" "myvm" {
ami = "ami-0c7217cdde317cfec"  
instance_type = "t2.medium"
security_groups = [ "default" ]
key_name = "25jan"
tags = {
  Name: "Jenkins_VM"
}
 connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("C:/Users/kedar/Downloads/25jan.pem")
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sleep 5",
      "sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key",
      "echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null",
      "sudo apt-get update",
      "sudo apt-get install fontconfig openjdk-17-jre -y",
      "sleep 5",
      "sudo apt-get install jenkins -y",
      "sleep 5",
      "sudo echo 'The initial admin password is: '; cat /var/lib/jenkins/secrets/initialAdminPassword"
    ]
  }
}
