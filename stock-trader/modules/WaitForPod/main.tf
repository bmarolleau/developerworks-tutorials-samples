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

resource "null_resource" "WaitingForDb2Pod" {
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/waitForPod.sh",
      "bash /tmp/waitForPod.sh ${var.namespace} ${var.args}",
    ]

    connection {
      host     = "${var.host}"
      type     = "ssh"
      user     = "ibmadmin"
      password = "${var.root_password}"
    }
  }
}
