provider "azurerm" {
  features { }
}

resource "azurerm_resource_group" "core" {
  name     = "s174d01-core"
  location = "West Europe"
  tags     = {
    "Environment"      = "dev"
    "Parent Business"  = "Schools and School Performance"
    "Portfolio"        = "Newly Onboarded"
    "Product"          = "Get Help Buying for Schools"
    "Service"          = "Newly Onboarded"
    "Service Line"     = "Newly Onboarded"
    "Service Offering" = "Get Help Buying for Schools"
  }
}
