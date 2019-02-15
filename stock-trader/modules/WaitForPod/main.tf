variable "host" {
  description = "IP of host to ssh"
}

variable "username" {
  description = "ssh ibmadmin password"
}
variable "password" {
  description = "ssh ibmadmin password"
}

variable "icp_username" {
  description = "k8s icp admin username"
}
variable "icp_password" {
  description = "admin icp password"
}
variable "icp_master_ip" {
  description = "k8s master ip"
}
variable "namespace" {
  default     = "default"
  description = "namespace"
}

variable "kubectlargs" {
  default     = "-- create --user team3 --password abc123 --release vision"
  description = "command to manage paiv users"
}

resource "null_resource" "ExecuteK8s" {
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/executeKubectl.sh",
      "bash /tmp/executeKubectl.sh ${var.namespace} ${var.icp_username} ${var.icp_password} ${var.icp_master_ip} ${var.kubectlargs}",
    ]

    connection {
      host     = "${var.host}"
      type     = "ssh"
      user     = "${var.username}"
      password = "${var.password}"
    }
  }
}
