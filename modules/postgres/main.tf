resource "azurerm_postgresql_server" "postgres_server" {
  name                         = var.server_name
  location                     = var.server_location
  resource_group_name          = var.server_resource_group_name
  sku_name                     = var.server_sku_name
  storage_mb                   = var.server_storage_mb
  backup_retention_days        = var.server_backup_retention_days
  geo_redundant_backup_enabled = var.server_geo_redundant_backup_enabled
  auto_grow_enabled            = var.server_auto_grow_enabled
  administrator_login          = var.server_administrator_login
  administrator_login_password = var.server_administrator_login_password
  version                      = var.server_version
  ssl_enforcement_enabled      = var.server_ssl_enforcement_enabled
  tags                         = var.server_tags
}

resource "azurerm_postgresql_database" "postgres_db" {
  name                = var.db_name
  resource_group_name = azurerm_postgresql_server.postgres_server.resource_group_name
  server_name         = azurerm_postgresql_server.postgres_server.name
  charset             = var.db_charset
  collation           = var.db_collation
}

resource "azurerm_postgresql_firewall_rule" "postgres_firewall_rule" {
  count = length(var.firewall_rules)

  name                = var.firewall_rules[count.index].name
  resource_group_name = azurerm_postgresql_server.postgres_server.resource_group_name
  server_name         = azurerm_postgresql_server.postgres_server.name
  start_ip_address    = var.firewall_rules[count.index].start_ip_address
  end_ip_address      = var.firewall_rules[count.index].end_ip_address
}
