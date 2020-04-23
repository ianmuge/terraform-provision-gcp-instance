variable "network" {
  default = "test"
}
variable "tags" {
  default = []
}
variable "labels" {
  default = {}
}
variable "instance" {
  default = {
    count             = 2
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

