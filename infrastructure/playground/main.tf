provider "aws" {
	region = "ap-southeast-1"
	profile = "default"
}

resource "aws_instance" "example1" {
	connection {
		type = "ssh"
		user = "ubuntu"
		private_key = "${file(var.private_key_path)}"
	}
	ami = "ami-2378f540"
	instance_type = "${var.instance_type}"
	security_groups = "${var.security_group}"
	key_name = "${var.key_name}"
	tags {
		Name = "${var.instance_name}"
	}
}


resource "aws_key_pair" "example" {
	key_name = "key2"
	public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvQuJf0Wm/dNCM1lfS4tPcqyrOly+Gmfo99cv+rz+dVNDqVHR7LmEeb9Eo5TiRrG2fcHoFW41n0htWk7zUyPcYXaw30XPxyXXQULAyGWNbu/U3Li6yz6nQuLbdO3RRqiiBxcyPgBL750VRglZGNHZ0Wkk8TjFoRjf2s8GVCFRE5Zfq2WfwTyGMedrI6JKpMqu1uZkvtuJI86RGCx126sWGTUA/uB542UQPLiLB/OjGhIZ8DZzH6NY43e5W4SeXlAi+djtv+gLEx3m80dqs8fK2NtrFMdZYg4hdf26yrHOr2Y/Eg0PEt7Dv7ETIpD16+pHhNDE/26T7pbC8o/C6pX1p mingk@DESKTOP-GGEI9QS"
}

