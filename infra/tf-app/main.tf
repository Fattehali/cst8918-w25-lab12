resource "azurerm_resource_group" "app_rg" {
  name     = "suna0011-shar0055-a12-rg"
  location = "East US"
}

resource "azurerm_virtual_network" "main_vnet" {
  name                = "lab12-vnet"
  location            = azurerm_resource_group.app_rg.location # Corrected
  resource_group_name = azurerm_resource_group.app_rg.name     # Corrected
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "main_subnet" {
  name                 = "lab12-subnet"
  resource_group_name  = azurerm_resource_group.app_rg.name # Corrected
  virtual_network_name = azurerm_virtual_network.main_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

