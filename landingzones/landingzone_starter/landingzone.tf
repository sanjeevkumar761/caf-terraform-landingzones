## declare here the resources for your landing zone

resource "azurerm_resource_group" "sap_rg" {
  name     = "sap_rg"
  location = "West US"
}

resource "azurerm_virtual_network" "sap_vnet" {
  name                = "sap_vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.sap_rg.location
  resource_group_name = azurerm_resource_group.sap_rg.name
}

resource "azurerm_subnet" "app_subnet" {
  name                 = "app_subnet"
  resource_group_name  = azurerm_resource_group.sap_rg.name
  virtual_network_name = azurerm_virtual_network.sap_vnet.name
  address_prefix     = "10.0.1.0/24"
}

resource "azurerm_subnet" "db_subnet" {
  name                 = "db_subnet"
  resource_group_name  = azurerm_resource_group.sap_rg.name
  virtual_network_name = azurerm_virtual_network.sap_vnet.name
  address_prefix     = "10.0.2.0/24"
}
