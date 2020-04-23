output "Instances" {
  value = "${google_compute_instance.test.*.id}"
}
