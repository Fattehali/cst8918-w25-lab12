provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name   = "suna0011-shar0055-githubactions-rg"
    storage_account_name  = "suna0011-shar0055-githubactions"
    container_name        = "tfstate"
    key                   = "prod.app.tfstate"
  }
}

resource "azurerm_resource_group" "example" {
  name     = "suna0011-shar0055-githubactions-rg"
  location = "East US"
}

resource "azurerm_storage_account" "example" {
  name                     = "suna0011-shar0055-githubactions"
  resource_group_name       = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier              = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

resource "azurerm_storage_container" "example" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}

output "resource_group_name" {

  value = azurerm_resource_group.rg.name

}
 
output "storage_account_name" {

  value = azurerm_storage_account.sa.name

}
 
output "container_name" {

  value = azurerm_storage_container.container.name

}
 
output "arm_access_key" {

  value     = azurerm_storage_account.sa.primary_access_key

  sensitive = true

}

 