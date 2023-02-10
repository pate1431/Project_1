
variable "fellowUser" {
  default     = ["meet", "vedant", "harshil", "ruju"]
  description = "IAM users for count"
}

variable "buscketName" {
  default     = "bucketNo"
  description = "bucketname for S3 bucker"
}
variable "resourceGrpName" {
  default     = "resourceGrpMain"
  description = "resource group name"
}
variable "resourceGrpLocation" {
  default     = "canada-central"
  description = "resource group location"
}
variable "virtualNetworkName" {
  default     = "virtualNetworkOne"
  description = "Virtual Network Name for Azure VM"
}
variable "storageAccName" {
  default     = "storageaccountone"
  description = "Azure Storage account name"

}
variable "storageAccTier" {
  default     = "Standard"
  description = "Azure Storage account tier"
}
variable "storageAccReplication" {
  default     = "LRS"
  description = "Azure storage account replication type"
}
variable "subnetName" {
  default     = "internal"
  description = "Subnet Name for Azure VM"
}
variable "networkInterfaceName" {
  default     = "projectnetworkinterface"
  description = "Network Interface Name for Azure VM"
}
variable "virtualMachinemName" {
  default     = "projectmachine"
  description = "Virtual Machine Name "
}