# K/V Store that is used for network device demo
resource "vault_mount" "kvv2" {
  path        = "kv"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

# KV - core_router01 for network demo
resource "vault_kv_secret_v2" "core_router01" {
  mount = vault_mount.kvv2.path
  name = "network_devices/core_router01"
  data_json = jsonencode(
    {
      username = "admin",
      password = "password",
      snmp_ro_string = "core_1_ro",
      snmp_rw_string = "core_1_rw"
    }
  )
}

# KV - core_router02 for network demo
resource "vault_kv_secret_v2" "core_router02" {
  mount = vault_mount.kvv2.path
  name = "network_devices/core_router02"
  data_json = jsonencode(
    {
      username = "admin",
      password = "password",
      snmp_ro_string = "core_2_ro",
      snmp_rw_string = "core_2_rw"
    }
  )
}
