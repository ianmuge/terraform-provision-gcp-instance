data "external" "GCP_CREDENTIALS" {
  program = ["/bin/bash", "-c", "echo \"{\\\"project\\\":\\\"$GCP_PROJECT\\\",\\\"region\\\":\\\"$GCP_REGION\\\",\\\"credentials\\\":\\\"$GCP_SERVICE_ACCOUNT_FILE\\\"}\""]
}
provider "google" {
  region      = "${data.external.GCP_CREDENTIALS.result.region}"
  project     = "${data.external.GCP_CREDENTIALS.result.project}"
  credentials = "${file("${data.external.GCP_CREDENTIALS.result.credentials}")}"
}

resource "google_compute_instance" "test" {
  count               = "${var.instance.count}"
  name                = "${var.instance.name}-${count.index}"
  machine_type        = "${var.instance.type}"
  zone                = "${data.external.GCP_CREDENTIALS.result.region}-${var.instance.zone}"
  can_ip_forward      = "${var.instance.can_ip_forward}"
  deletion_protection = "${var.instance.delete_protection}"
  tags                = "${var.tags}"

  boot_disk {
    auto_delete = true
    initialize_params {
      size  = "${var.boot_disk.size}"
      image = "${var.boot_disk.image}"
    }
  }

  network_interface {
    network = "${var.network}"
    access_config {
    }
  }
  labels = "${var.labels}"
  metadata = {
    ssh-keys = "${var.username}:${file("${var.public_key_path}")}"
  }
}
