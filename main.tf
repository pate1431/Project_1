#
# Azure AD user for trainer and snehal
#
resource "azuread_user" "user_ibrahim" {
  user_principal_name   = "ibrahim@fdm.com"
  display_name          = "Ibrahim"
  password              = "fdm@123"
  force_password_change = true

}
resource "azuread_user" "user_snehal" {
  user_principal_name = "snehal@fdm.com"
  display_name        = "Snehal"
  password            = "fdm@456"

}

#
# AWS IAM user for 4 users using FOREACH
#

resource "aws_iam_user" "fellow_users" {
  for_each = toset(var.fellowUser)
  name     = each.value
}

#
# AWS S3 Bucket using count
#

resource "aws_s3_bucket" "bucket_Count" {
  bucket = var.buscketName
  count  = 2
}

#
# Azure resource group 
#

resource "azurerm_resource_group" "resourceGrp" {
  name     = var.resourceGrpName
  location = var.resourceGrpLocation
  tags = {
    "name"       = "Main Resource Group"
    "department" = "Academy"
  }
}

#
# Azure storage Account 
#

resource "azurerm_storage_account" "storageACC" {
  name                     = var.storageAccName
  resource_group_name      = azurerm_resource_group.resourceGrp.name
  location                 = azurerm_resource_group.resourceGrp.location
  account_tier             = var.storageAccTier
  account_replication_type = var.storageAccReplication
  tags = {
    "name"       = "Storage account"
    "department" = "Academy"
  }

}

#
# Azure Virtual machine and the rquired resources for the Virtual machine 
#

resource "azurerm_virtual_network" "vmOne" {
  name                = var.virtualNetworkName
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.resourceGrp.location
  resource_group_name = azurerm_resource_group.resourceGrp.name
}

resource "azurerm_subnet" "subnetForVm" {
  name                 = var.subnetName
  resource_group_name  = azurerm_resource_group.resourceGrp.name
  virtual_network_name = azurerm_virtual_network.vmOne.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "networkInterface" {
  name                = var.networkInterfaceName
  location            = azurerm_resource_group.resourceGrp.location
  resource_group_name = azurerm_resource_group.resourceGrp.name

  ip_configuration {
    name                          = var.subnetName
    subnet_id                     = azurerm_subnet.subnetForVm.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = var.virtualMachinemName
  resource_group_name = azurerm_resource_group.resourceGrp.name
  location            = azurerm_resource_group.resourceGrp.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.networkInterface.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}