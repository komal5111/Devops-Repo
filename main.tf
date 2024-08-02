resource "azurerm_resource_group" "kalu" {
  name     = "shamu"
  location = "eastus"
}

resource "azurerm_storage_account" "ram" {
  name                     = "hamuman"
  resource_group_name      = azurerm_resource_group.kalu.name
  location                 = azurerm_resource_group.kalu.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_virtual_network" "kalunet" {
  name                = "shamunet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.kalu.location
  resource_group_name = azurerm_resource_group.kalu.name
}

resource "azurerm_subnet" "kalusubnet" {
  name                 = "shamusubnet"
  resource_group_name  = azurerm_resource_group.kalu.name
  virtual_network_name = azurerm_virtual_network.kalunet.name
  address_prefixes     = ["10.0.0.0/24"]
  service_endpoints    = ["Microsoft.sql", "Microsoft.Storage"]
}
