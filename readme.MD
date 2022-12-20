# Configure Vault for Cisco network demo

This Terraform code will configure HashiCorp Vault with the necessary values for my Cisco Ansible demo.

The ansible playbook is located at [https://github.com/jshively37/ansible-hashi-vault-demo](https://github.com/jshively37/ansible-hashi-vault-demo)

## Terraform Code

The Terraform code in this repo will be responsible for:
* Configuring a K/V v2 secrets engine.
* Creating two K/V entries under kv/network_devices/ for both network devices:
  * core_router01
  * core_router02

## Consuming

This Terraform code is configured for my TFCB instance and a specific workspace using HCP Vault. This is handled by a seperate workspace and the code to create the HCP Vault instance can be found at [https://github.com/jshively37/terraform-create-hcp-vault](https://github.com/jshively37/terraform-create-hcp-vault)

To use your own instance please follow the below instructions:

* Fork this repo.
* Delete the following two files: `rm cloud_config.tf && rm remote_state_read.tf` (If you wish to use your own TFCB/TFE organization you can update the information with your specific instance information).
* In `provider.tf` replace address and token on lines 11 and 12 with your information (these values can also be passed using VAULT_TOKEN and VAULT_ADDR environment blocks).
* Run `terraform init`
* Run `terraform plan` and validate 3 items to be added.
* Run `terraform apply -auto-approve` to add the k/v and two k/v entries.
