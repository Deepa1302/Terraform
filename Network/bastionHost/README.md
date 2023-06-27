# About Custom Module "bastionHost" 🌐

This modules is to create a bastionHost and its associated Networking components. Depending on the requirements, only required arguments in each module are assigned. 

## Input Variable Definitions
| Variable                                   | Default | Required | Description                                                                                                                                       |
|--------------------------------------------|---------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| bhs_name                                   | -       | Yes      | Specifies the name of the Bastion Host.
| resource_group_name                        | -       | Yes      | The name of the resource group in which to create the Bastion Host.
| location                                   | -       | Yes      | Specifies the supported Azure location where the resource exists.
| bhs_ip_name                                | -       | Yes      | The name of the IP configuration.
| bhs_ip_subnet_id                           | -       | Yes      | Reference to a subnet in which this Bastion Host has been created.
| bhs_ip_pip_address_id                      | -       | Yes      | Reference to a Public IP Address to associate with this Bastion Host.
| tags_BHS                                   | -       | Yes      | A mapping of tags to assign to the resource.

## Output Variable Definitions
| Variable                                      | Is Output a List | Description                                                                                                                                              |
|-----------------------------------------------|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------- |
| bhs_id                                        | No               | The ID of the Bastion Host.
| bhs_fqdn                                      | No               | The FQDN for the Bastion Host.

## Sample Usage
```
module "m_bhs_01" {
  source                = "../Modules/Network/bastionHost"
  bhs_name              = "poc-bhs-01"
  resource_group_name   = module.m_rg_POC_01.rg_name
  location              = module.m_rg_POC_01.rg_location
  // IP Configuration block
  bhs_ip_name           = module.m_publicIP_NetworkComponents_01.pip_name
  bhs_ip_subnet_id      = module.m_subNet_NetworkComponents_01.subnet_id
  bhs_ip_pip_address_id = module.m_publicIP_NetworkComponents_01.pip_id
  tags_BHS  = { 
    environment        = "sandbox"
    protection-profile = "Not Applicable"
  }
}
```
## Guidelines
1.	Update the name of module to keep it unique and use comment blocks & descriptions wherever required; For example-
    ```
    #------------------------------------ DES: bastionHost  -------------------------
    module "m_bhs_bastionHost_01" {
      source                                 = "../Modules/Network/bastionHost"
      //bastionHost Specifications
      bhs_name                               = "poc-bhs-01"
    ```
2.  Update values for each arguments that references outputs from other modules within the main file
3.	Optionally, eliminate the declaration of default arguments unless the default values have to be over-ridden
4.  Create the defined variables in `variables.tf` file under respective `Core` folders
5.  Assign values to the created variables in `Environmental.tfvars` file under respective `Core` folders