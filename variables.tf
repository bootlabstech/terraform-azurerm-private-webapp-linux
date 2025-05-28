variable "name" {
  type        = string
  description = "The name for the Linux Web App."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where the Linux Web App will be created."
}

variable "location" {
  type        = string
  description = "The Azure region for the Linux Web App (e.g., Central India, South India)."
}

variable "service_plan_id" {
  type        = string
  description = "The App Service Plan ID that this Linux Web App will use."
}

variable "ftps_state" {
  type        = string
  description = "FTP / FTPS state: AllAllowed, FtpsOnly, or Disabled."
  default     = "FtpsOnly"
}

variable "app_command_line" {
  type        = string
  description = "Custom startup command line for the app."
  default     = ""
}

variable "current_stack" {
  type        = string
  description = "Technology stack: node, python, php, ruby, java, dotnetcore, etc."
}

variable "stack_version" {
  type        = string
  description = "Version of the selected stack (e.g., 16 for Node.js, 3.9 for Python)."
}

variable "vnet_route_all_enabled" {
  type        = bool
  description = "Enable all outbound traffic to go through the VNet."
  default     = true
}

variable "https_only" {
  type        = bool
  description = "Enforce HTTPS-only traffic."
  default     = true
}

variable "ip_restrictions" {
  type = map(object({
    ip_address = string
    priority   = number
  }))
  default = {
    cf1  = { ip_address = "173.245.48.0/20", priority = 100 }
    cf2  = { ip_address = "103.21.244.0/22", priority = 100 }
    cf3  = { ip_address = "103.22.200.0/22", priority = 100 }
    cf4  = { ip_address = "103.31.4.0/22", priority = 100 }
    cf5  = { ip_address = "141.101.64.0/18", priority = 100 }
    cf6  = { ip_address = "108.162.192.0/18", priority = 100 }
    cf7  = { ip_address = "190.93.240.0/20", priority = 100 }
    cf8  = { ip_address = "188.114.96.0/20", priority = 100 }
    cf9  = { ip_address = "197.234.240.0/22", priority = 100 }
    cf10 = { ip_address = "198.41.128.0/17", priority = 100 }
    cf11 = { ip_address = "162.158.0.0/15", priority = 100 }
    cf12 = { ip_address = "104.16.0.0/13", priority = 100 }
    cf13 = { ip_address = "104.24.0.0/14", priority = 100 }
    cf14 = { ip_address = "172.64.0.0/13", priority = 100 }
    cf15 = { ip_address = "131.0.72.0/22", priority = 100 }
  }
}


variable "virtual_network_subnet_id" {
  type        = string
  description = "ID of the VNet subnet to integrate the Linux Web App with."
}

# Container-based deployment variables (optional)
variable "docker_image_name" {
  type        = string
  description = "Name of the Docker image to use."
  default     = ""
}

variable "docker_registry_url" {
  type        = string
  description = "Docker registry URL (e.g., https://index.docker.io, https://mcr.microsoft.com)."
  default     = "https://mcr.microsoft.com"
}

variable "docker_registry_username" {
  type        = string
  description = "Username for Docker registry (if private)."
  default     = "admin"
}

variable "docker_registry_password" {
  type        = string
  description = "Password for Docker registry (if private)."
  default     = "Welcome@1234"
}

# Private Endpoint variables
variable "private_endpoint_subnet_id" {
  type        = string
  description = "Subnet ID from which Private IP Addresses will be allocated for this Private Endpoint."
}

variable "is_manual_connection" {
  type        = bool
  description = "Does the Private Endpoint require manual approval?"
  default     = false
}

variable "subresource_names" {
  type        = list(string)
  description = "Subresources the Private Endpoint can connect to."
  default     = ["sites"]
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "List of Private DNS Zones to associate with the Private Endpoint."
}

variable "ip_configuration" {
  type        = bool
  description = "Use static IP for the Private Endpoint?"
  default     = false
}