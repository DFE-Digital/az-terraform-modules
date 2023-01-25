resource "azurerm_postgresql_server" "postgres_server" {
  name                = "poc-pg-server"
  location            = azurerm_resource_group.core.location
  resource_group_name = azurerm_resource_group.core.name

  sku_name = "B_Gen5_1"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true
  # TODO: variables needed here
  administrator_login          = "- redacted -"
  administrator_login_password = "- redacted -"
  version                      = "11"
  ssl_enforcement_enabled      = true

  tags                         = {
    "Environment"      = "dev"
    "Parent Business"  = "Schools and School Performance"
    "Portfolio"        = "Newly Onboarded"
    "Product"          = "Get Help Buying for Schools"
    "Service"          = "Newly Onboarded"
    "Service Line"     = "Newly Onboarded"
    "Service Offering" = "Get Help Buying for Schools"
  }
}

resource "azurerm_postgresql_database" "postgres_db" {
  name                = "poc-database"
  resource_group_name = azurerm_resource_group.core.name
  server_name         = azurerm_postgresql_server.postgres_server.name
  charset             = "UTF8"
  collation           = "en-GB"
}

resource "azurerm_postgresql_firewall_rule" "global_protect" {
  name                = "poc-pg-server-fw-global-protect"
  resource_group_name = azurerm_resource_group.core.name
  server_name         = azurerm_postgresql_server.postgres_server.name
  start_ip_address    = "208.127.46.232"
  end_ip_address      = "208.127.46.255"
}
