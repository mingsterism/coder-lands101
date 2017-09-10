provider "aws" {
	region = "ap-southeast-1"
	profile = "default"
}

resource "aws_instance" "example" {
	connection {
		type = "ssh"
		user = "ubuntu"
		private_key = "${file(var.private_key_path)}"
	}
	ami 	= "${var.ami}"
	instance_type = "${var.instance_type}"
	security_groups = "${var.security_group}"
	key_name = "${var.key_name}"
	tags {
		"Name" = "${var.instance_name}"
	}
}


resource "aws_key_pair" "example" {
	key_name = "key1"
	public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDV+39Qkjy2fT7nNeLU0IplQOdmp/fgFn3JOmBKuuM1sn3L0f6uvCKrKp6nRSCh7LnMNF2NbZdZp/WzIvcQZv7KLYygWmzfsZzN5ej1BrpeiqZatrie4FJxWvXi/yRy5gkF9vTllGmRZTqGyJm56CFevO8w2GvEl3iyy4PXKwxRL3N0agu4KBops82wFr12WW/Y13wXbtUQ3rBLuQ7ZcZV/JPrVmjob/3lTI7H3PKEfxd1CigPxwX85ROMZyOiNdE8aWuTN8UcU/CmYeYPp3D66kpDVa56LXQKBl+2bqxXFVdUqBFwTnHhnX4T3iG3NlGKU01vje/yPzbg4jYl1RmQD mingk@DESKTOP-GGEI9QS"

}
