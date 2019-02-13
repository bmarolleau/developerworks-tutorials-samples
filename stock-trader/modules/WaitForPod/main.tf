variable "host" {
  description = "IP of host to ssh"
}

variable "root_password" {
  description = "ssh root password"
}

variable "namespace" {
  default     = "default"
  description = "namespace"
}

variable "args" {
  default     = "-- create --user team3 --password abc123 --release vision"
  description = "command to manage paiv users"
}

resource "null_resource" "ExecuteK8s" {
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/executeKubectl.sh",
      "bash /tmp/executeKubectl.sh ${var.args}",
    ]

    connection {
      host     = "${var.host}"
      type     = "ssh"
      user     = "ibmadmin"
      password = "${var.root_password}"
    }
  }
}
