variable "do_token" {}

provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "example_tomcat_0" {
  image      = "Debian-8-x64"
  name       = "example-tomcat-0"
  region     = "lon1"
  size       = "1GB"
  ssh_keys   = ["dd:eb:43:d4:66:e0:34:16:8b:e4:ca:68:5c:87:49:97"]

  provisioner "local-exec" {
    command = "sleep 30 && echo \"[dev]\n${digitalocean_droplet.example_tomcat_0.ipv4_address} ansible_connection=ssh ansible_ssh_user=root\" > inventory"
  }
}

resource "digitalocean_droplet" "example_tomcat_1" {
  image      = "Debian-8-x64"
  name       = "example-tomcat-1"
  region     = "lon1"
  size       = "1GB"
  ssh_keys   = ["dd:eb:43:d4:66:e0:34:16:8b:e4:ca:68:5c:87:49:97"]

  provisioner "local-exec" {
    command = "sleep 30 && echo \"${digitalocean_droplet.example_tomcat_1.ipv4_address} ansible_connection=ssh ansible_ssh_user=root\" >> inventory"
  }
}
