variable "key_name" {
	description = "Name of SSH keypair to use in AWS"
}

variable "instance_type" {
	description = "The type of the instance" 
	default = "t2.micro"
}

variable "instance_name" {
    description = "The name of the instance"
}

variable "security_group" {
	description = "The security group of your instance"
	default= ["default"]
}

variable "ami" {
	description = "Amazon AMI ID"
}
