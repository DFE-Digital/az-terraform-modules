resource "azurerm_service_plan" "service_plan" {
  name                = "poc-service-plan"
  resource_group_name = azurerm_resource_group.core.name
  location            = azurerm_resource_group.core.location
  os_type             = "Linux"
  sku_name            = "F1"
  tags                = {
    "Environment"      = "dev"
    "Parent Business"  = "Schools and School Performance"
    "Portfolio"        = "Newly Onboarded"
    "Product"          = "Get Help Buying for Schools"
    "Service"          = "Newly Onboarded"
    "Service Line"     = "Newly Onboarded"
    "Service Offering" = "Get Help Buying for Schools"
  }
}

resource "azurerm_linux_web_app" "web_server" {
  name                = "poc-web-server"
  location            = azurerm_resource_group.core.location
  resource_group_name = azurerm_resource_group.core.name
  service_plan_id     = azurerm_service_plan.service_plan.id
  tags                = {
    "Environment"      = "dev"
    "Parent Business"  = "Schools and School Performance"
    "Portfolio"        = "Newly Onboarded"
    "Product"          = "Get Help Buying for Schools"
    "Service"          = "Newly Onboarded"
    "Service Line"     = "Newly Onboarded"
    "Service Offering" = "Get Help Buying for Schools"
  }
  site_config {
    always_on = false
    application_stack {
      docker_image     = "strm/helloworld-http"
      docker_image_tag = "test"
    }
  }
  identity {
    type = "SystemAssigned"
  }
}

# Needs app registration to work (users cannot do role assignments)
# resource "azurerm_role_assignment" "web_app_postgres_read" {
#   scope                = azurerm_postgresql_server.postgres_server.id
#   role_definition_name = "Reader"
#   principal_id         = azurerm_linux_web_app.web_server.id
# }
