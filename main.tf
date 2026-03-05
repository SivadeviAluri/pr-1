provider "google" {
    project = var.project_id
    region = var.region
}

resource "google_compute_network" "vpc" {
    name = "nginx-network"
}

resource "google_compute_firewall" "firewall" {
    name = "nginx-firewall" 
    network = google_compute_network.vpc.name

    allow {
        protocol = "tcp"
        ports = ["22","80"]
    }
    source_ranges = ["0.0.0.0/0"]
}
resource "google_compute_instance" "nginx_vm" {
    name = "nginx-vm"
    machine_type = "e2-micro"
    zone = var.zone

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-12"
        }
    }
    network_interface {
        network = google_compute_network.vpc.name
        access_config {}
    }
    metadata_startup_script = <<EOF
   #!/bin/bash
   apt update && apt install -y nginx
   systemctl enable nginx
   systemctl start nginx
   EOF
}
   
 
