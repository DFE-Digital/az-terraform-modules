resource "azurerm_service_plan" "service_plan" {
  name                = var.service_plan_name
  resource_group_name = var.service_plan_resource_group_name
  location            = var.service_plan_location
  os_type             = var.service_plan_os_type
  sku_name            = var.service_plan_sku_name
  tags                = var.service_plan_tags
}

resource "azurerm_linux_web_app" "web_app" {
  name                = var.web_app_name
  location            = azurerm_service_plan.service_plan.location
  resource_group_name = azurerm_service_plan.service_plan.resource_group_name
  service_plan_id     = azurerm_service_plan.service_plan.id
  tags                = var.web_app_tags
  site_config {
    always_on = var.web_app_site_config_always_on
    application_stack {
      docker_image     = var.web_app_docker_image
      docker_image_tag = var.web_app_docker_image_tag
    }
  }
  identity {
    type = var.web_app_identity_type
  }
}
