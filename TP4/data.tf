# Utilisation des ressources de données pour récupérer des informations existantes sur Azure, telles que les sous-réseaux, les groupes de sécurité réseau, etc.

data "azurerm_resource_group" "tp4" {
  name = "ADDA84-CTP"
}

data "azurerm_virtual_network" "tp4" {
  name                = "network-tp4"
  resource_group_name = data.azurerm_resource_group.tp4.name
}

data "azurerm_subnet" "tp4" {
  name                 = "internal"
  virtual_network_name = data.azurerm_virtual_network.tp4.name
  resource_group_name  = data.azurerm_resource_group.tp4.name
}
