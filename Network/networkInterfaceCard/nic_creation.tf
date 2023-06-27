resource "azurerm_network_interface" "nic" {
  name                          = var.nic_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  dns_servers                   = var.nic_dns_servers
  enable_ip_forwarding          = var.nic_enable_ip_forwarding
  enable_accelerated_networking = var.nic_enable_accelerated_networking
  internal_dns_name_label       = var.nic_internal_dns_name_label

  tags = var.tags_NIC

  ip_configuration {

    name = var.vm_ip_config_name
    subnet_id = var.subnet_id
    private_ip_address_allocation = var.vm_ip_address_allocation
    private_ip_address = var.vm_private_ip_address 
    public_ip_address_id = var.is_vm_public_ip_needed == "true" ? var.publicip_id : ""

  }
  /*
  Note:
    If a Dynamic allocation method is used Azure will not allocate an IP Address until the Network Interface is attached to a running resource (such as a Virtual Machine).
*/
  /*dynamic "ip_configuration" {
    for_each = [for ips in var.nic_config_ips : {
      name            = ips.name
      subnet_id       = ips.subnet_id
      prIP_version    = ips.private_ip_address_version
      prIP_address    = ips.private_ip_address
      prIP_allocation = ips.private_ip_address_allocation
      puIP_ID         = ips.public_ip_address_id
      IsPrimary       = ips.primary
    }]

    content {
      name                          = ip_configuration.value.name
      subnet_id                     = ip_configuration.value.subnet_id
      private_ip_address_version    = ip_configuration.value.prIP_version
      private_ip_address_allocation = ip_configuration.value.prIP_allocation
      public_ip_address_id          = ip_configuration.value.puIP_ID
      primary                       = ip_configuration.value.IsPrimary
      private_ip_address            = ip_configuration.value.prIP_address
    }

  }
  */
}