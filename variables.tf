variable "instance_name" {
    default = "Jenkins Server"  # Names the instance
}

variable "key_name" {
  default = "YOUR_KEY_NAME"                  # Names of key in aws
}
variable "private_key" {
  default = file("YOUR_PRIVATE_KEY_PEM_FILE_PATH")      # file path of private pem key
}

variable "access_key" {
  default = "AWS_ACCESS_KEY"                # aws access key
}

variable "secret_key" {
  default = "AWS_SECRET_KEY"         # aws secret key
}

