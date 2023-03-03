variable "service_plan_name" {
  type = string
}

variable "service_plan_resource_group_name" {
  type = string
}

variable "service_plan_location" {
  type = string
}

variable "service_plan_os_type" {
  type = string
}

variable "service_plan_sku_name" {
  type = string
}

variable "service_plan_tags" {
  type = map(string)
}

variable "web_app_name" {
  type = string
}

variable "web_app_tags" {
  type = map(string)
}

variable "web_app_site_config_always_on" {
  type = bool
}

variable "web_app_docker_image" {
  type = string
}

variable "web_app_docker_image_tag" {
  type = string
}

variable "web_app_identity_type" {
  type    = string
  default = "SystemAssigned"
}
