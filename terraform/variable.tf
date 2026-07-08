variable "region" {
  default = "eu-north-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ami" {
  default = "ami-0aba19e56f3eaec05" # Ubuntu 24.04 LTS (example)
}

variable "key_name" {
  default = "test"
}