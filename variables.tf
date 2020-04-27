variable "network" {
  default = "default"
}
variable "tags" {
  default = []
}
variable "labels" {
  default = {}
}
variable "username" {
  default="imuge94"
}

variable "public_key_path" {
  default="~/.ssh/id_rsa.pub"

}
variable "instance" {
  default = {
    count             = 1
    name              = "test"
    type              = "n1-standard-1"
    zone              = "a"
    delete_protection = false
    can_ip_forward    = true
  }
}

variable "boot_disk" {
  default = {
    name        = "test"
    auto_delete = true
    image       = "debian-cloud/debian-9"
    size        = 100
  }
}

