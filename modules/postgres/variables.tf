variable "server_name" {
  type = string
}

variable "server_location" {
  type = string
}

variable "server_resource_group_name" {
  type = string
}

variable "server_sku_name" {
  type = string
}

variable "server_storage_mb" {
  type = number
}

variable "server_backup_retention_days" {
  type = number
}

variable "server_geo_redundant_backup_enabled" {
  type = bool
}

variable "server_auto_grow_enabled" {
  type = bool
}

variable "server_administrator_login" {
  type = string
}

variable "server_administrator_login_password" {
  type = string
}

variable "server_version" {
  type = string
}

variable "server_ssl_enforcement_enabled" {
  type = bool
}

variable "server_tags" {
  type = map(string)
}

variable "db_name" {
  type = string
}

variable "db_charset" {
  type    = string
  default = "UTF8"
}

variable "db_collation" {
  type    = string
  default = "en-GB"
}

variable "firewall_rules" {
  type = list(object({
    name             = string
    start_ip_address = string
    end_ip_address   = string
  }))
  default = []
}
