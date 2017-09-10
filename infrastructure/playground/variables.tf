variable "instance_type" {
	description = "Instance type"
	default = "t2.micro"
}

variable "security_group" {
	description = "Security group of this instance"
	default = ["default"]
}

variable "private_key_path" {
	description = "Path to private key"
}

variable "key_name" {
	description = "keys"
}

variable "instance_name" {
	description = "blabla"
}
