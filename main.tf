resource "google_compute_network" "default" {
  name                    = "${var.network_name}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "default" {
  name                     = "${var.network_name}"
  ip_cidr_range            = "${var.network_cidr}"
  network                  = "${google_compute_network.default.self_link}"
  region                   = "${var.region}"
  private_ip_google_access = true
}

resource "google_compute_instance" "default" {
  count                     = "${var.num_nodes}"
  name                      = "${var.name}-${count.index + 1}"
  zone                      = "${var.zone}"
  machine_type              = "${var.ai_machine_type}"
  min_cpu_platform          = "${var.min_cpu_platform}"
  allow_stopping_for_update = true

  boot_disk {
    auto_delete = "${var.disk_auto_delete}"

    initialize_params {
      image = "${var.image_project}/${var.image_family}"
      size  = "${var.disk_size_gb}"
      type  = "${var.disk_type}"
    }
  }

  metadata = {
    ssh-keys = "jalil:${file("~/.ssh/id_rsa.pub")}"
    //install-nvidia-driver = true
 }

  network_interface {
    subnetwork    = "${google_compute_subnetwork.default.name}"

    access_config {
     // Include this section to give the VM an external Ephemeral IP address 
    }
  }
  
  scratch_disk {
    interface = "NVME"
  }

  guest_accelerator {
    type    = "nvidia-tesla-p100"
    count   = 1
  }

  scheduling {
    //preemptible = true
    on_host_maintenance   = "TERMINATE"
    automatic_restart  = false
  }

}

resource "google_compute_firewall" "ssh" {
  name    = "${var.name}-ssh"
  network = "${google_compute_subnetwork.default.name}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}


resource "google_compute_firewall" "jupyter" {
  name    = "${var.jupyter_name}"
  network = "${google_compute_subnetwork.default.name}"

  allow {
    protocol = "tcp"
    ports    = ["5000"]
  }
  source_ranges = ["0.0.0.0/0"]
  source_tags = ["${var.jupyter_name}-ai"]
}