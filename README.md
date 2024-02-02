# How to setup Jenkins using Terraform

## Overview

This Terraform configuration automates the setup of a Jenkins server on an AWS EC2 instance. It provisions the necessary infrastructure and installs Jenkins along with its dependencies.

### Files Included

- **main.tf**: Defines the AWS resources and provisions the EC2 instance.
- **variables.tf**: Declares the input variables used in the Terraform configuration.
- **outputs.tf**: Defines the output values returned after the Terraform apply.
- **README.md**: Provides instructions and information for users and contributors.

## Terraform Configuration Details

### Providers

- **AWS Provider**: Configured to interact with AWS services.
  - Version: ~> 5.0

### Resources

- **AWS Instance**: Defines the EC2 instance.
  - AMI: ami-0c7217cdde317cfec
  - Instance Type: t2.medium
  - Security Groups: Default
  - Key Pair Name: Provided by the user
  - Tags: Name: "Jenkins_VM"

### Provisioners

- **Remote-exec Provisioner**: Executes commands remotely on the EC2 instance after creation.
  - Updates package repositories.
  - Installs Fontconfig and OpenJDK 17 JRE.
  - Installs Jenkins.
  - Displays the initial admin password for Jenkins.

## Usage Instructions

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/your-project.git

2. Navigate to the project directory:
   ```bash
   cd your-project

3. Fill in the required information in variables.tf:
   ```bash
   access_key = "YOUR_AWS_ACCESS_KEY"
   secret_key = "YOUR_AWS_SECRET_KEY"
   key_name = "YOUR_AWS_KEY_PAIR_NAME"
   private_key = file("PATH_TO_YOUR_PRIVATE_KEY_FILE")


4. Initialize Terraform:
   ```bash
   terraform init

6. Apply the Terraform configuration:
   ```bash
   terraform apply

7. Access Jenkins using the public IP address of the AWS instance.

### Contributing
Contributions to this project are welcome! Follow the guidelines provided in the README to contribute effectively.

