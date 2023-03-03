provider "azurerm" {
  features {}
}

# TODO: Variables at this level

module "resource_group" {
  source   = "../../modules/resource_group"
  name     = "s174d01-core"
  location = "West Europe"
  tags = {
    "Environment"      = "dev"
    "Parent Business"  = "Schools and School Performance"
    "Portfolio"        = "Newly Onboarded"
    "Product"          = "Getting Help Buying for Schools (GHBS)"
    "Service"          = "Newly Onboarded"
    "Service Line"     = "Newly Onboarded"
    "Service Offering" = "Getting Help Buying for Schools (GHBS)"
  }
}

module "postgres_db" {
  source                              = "../../modules/postgres"
  server_name                         = "poc-pg-server"
  server_location                     = module.resource_group.location
  server_resource_group_name          = module.resource_group.name
  server_sku_name                     = "B_Gen5_1"
  server_storage_mb                   = 5120
  server_backup_retention_days        = 7
  server_geo_redundant_backup_enabled = false
  server_auto_grow_enabled            = true
  server_administrator_login          = "- redacted -"
  server_administrator_login_password = "- redacted -"
  server_version                      = "11"
  server_ssl_enforcement_enabled      = true
  server_tags = {
    "Environment"      = "dev"
    "Parent Business"  = "Schools and School Performance"
    "Portfolio"        = "Newly Onboarded"
    "Product"          = "Get Help Buying for Schools"
    "Service"          = "Newly Onboarded"
    "Service Line"     = "Newly Onboarded"
    "Service Offering" = "Get Help Buying for Schools"
  }
  db_name = "poc-database"
  firewall_rules = [
    {
      name             = "poc-pg-server-fw-global-protect"
      start_ip_address = "208.127.46.232"
      end_ip_address   = "208.127.46.255"
    }
  ]
}

module "rails_web_server" {
  source                           = "../../modules/app_service"
  service_plan_name                = "poc-service-plan"
  service_plan_location            = module.resource_group.location
  service_plan_resource_group_name = module.resource_group.name
  service_plan_os_type             = "Linux"
  service_plan_sku_name            = "F1"
  service_plan_tags = {
    "Environment"      = "dev"
    "Parent Business"  = "Schools and School Performance"
    "Portfolio"        = "Newly Onboarded"
    "Product"          = "Get Help Buying for Schools"
    "Service"          = "Newly Onboarded"
    "Service Line"     = "Newly Onboarded"
    "Service Offering" = "Get Help Buying for Schools"
  }
  web_app_name = "poc-web-server"
  web_app_tags = {
    "Environment"      = "dev"
    "Parent Business"  = "Schools and School Performance"
    "Portfolio"        = "Newly Onboarded"
    "Product"          = "Get Help Buying for Schools"
    "Service"          = "Newly Onboarded"
    "Service Line"     = "Newly Onboarded"
    "Service Offering" = "Get Help Buying for Schools"
  }
  web_app_site_config_always_on = true
  web_app_docker_image          = "strm/helloworld-http"
  web_app_docker_image_tag      = "test"
  web_app_identity_type         = "SystemAssigned"
}

module "rails_web_worker" {
  source                           = "../../modules/app_service"
  service_plan_name                = "poc-service-plan"
  service_plan_location            = module.resource_group.location
  service_plan_resource_group_name = module.resource_group.name
  service_plan_os_type             = "Linux"
  service_plan_sku_name            = "F1"
  service_plan_tags = {
    "Environment"      = "dev"
    "Parent Business"  = "Schools and School Performance"
    "Portfolio"        = "Newly Onboarded"
    "Product"          = "Get Help Buying for Schools"
    "Service"          = "Newly Onboarded"
    "Service Line"     = "Newly Onboarded"
    "Service Offering" = "Get Help Buying for Schools"
  }
  web_app_name = "poc-web-server"
  web_app_tags = {
    "Environment"      = "dev"
    "Parent Business"  = "Schools and School Performance"
    "Portfolio"        = "Newly Onboarded"
    "Product"          = "Get Help Buying for Schools"
    "Service"          = "Newly Onboarded"
    "Service Line"     = "Newly Onboarded"
    "Service Offering" = "Get Help Buying for Schools"
  }
  web_app_site_config_always_on = true
  web_app_docker_image          = "strm/helloworld-http"
  web_app_docker_image_tag      = "test"
  web_app_identity_type         = "SystemAssigned"
}


