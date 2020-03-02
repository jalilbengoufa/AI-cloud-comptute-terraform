variable "region" {
  default = "us-east1"
}

variable "zone" {
  default = "us-east1-b"
}

variable "min_cpu_platform" {
  description = "Specifies a minimum CPU platform for the VM instance. Applicable values are the friendly names of CPU platforms, such as Intel Haswell or Intel Skylake. https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform"
  default     = "Automatic"
}

variable "name" {
  description = "Name prefix for the nodes"
  default     = "tf-ai"
}

variable "jupyter_name" {
  description = "Name prefix for the nodes"
  default     = "jupyter"
}

variable "num_nodes" {
  description = "Number of nodes to create"
  default     = 1
}

variable "image_family" {
  default = "ubuntu-1804-lts"
}

variable "image_project" {
  default = "ubuntu-os-cloud"
}

variable "disk_auto_delete" {
  description = "Whether or not the disk should be auto-deleted."
  default     = true
}

variable "disk_type" {
  description = "The GCE disk type. Can be either pd-ssd, local-ssd, or pd-standard."
  default     = "pd-ssd"
}

variable "disk_size_gb" {
  description = "The size of the image in gigabytes."
  default     = 40
}


variable "network_ip" {
  description = "Set the network IP of the instance. Useful only when num_nodes is equal to 1."
  default     = ""
}

variable "network_cidr" {
  default = "10.127.0.0/20"
}

variable "network_name" {
  default = "tf-custom-ai-machine"
}

variable "service_account_scopes" {
  description = "List of scopes for the instance template service account"
  type        = list(string)

  default = [
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring.write",
    "https://www.googleapis.com/auth/devstorage.full_control",
  ]
}

// AI host
variable "ai_image_family" {
  default = "tf2-2-0-cu100"
}

variable "ai_image_project" {
  default = "deeplearning-platform-release"
}

variable "ai_machine_type" {
  default = "n1-standard-16"
}


