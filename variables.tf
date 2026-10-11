variable "gkeonprem_vmware_clusters" {
  description = <<EOT
Map of gkeonprem_vmware_clusters, attributes below
Required:
    - admin_cluster_membership
    - location
    - name
    - on_prem_version
    - control_plane_node (block):
        - auto_resize_config (optional, block):
            - enabled (required)
        - cpus (optional)
        - memory (optional)
        - replicas (optional)
Optional:
    - annotations
    - deletion_policy
    - description
    - disable_bundled_ingress
    - enable_advanced_cluster
    - enable_control_plane_v2
    - project
    - skip_validations
    - vm_tracking_enabled
    - anti_affinity_groups (block):
        - aag_config_disabled (required)
    - authorization (block):
        - admin_users (optional, block):
            - username (required)
    - auto_repair_config (block):
        - enabled (required)
    - dataplane_v2 (block):
        - advanced_networking (optional)
        - dataplane_v2_enabled (optional)
        - windows_dataplane_v2_enabled (optional)
    - load_balancer (block):
        - f5_config (optional, block):
            - address (optional)
            - partition (optional)
            - snat_pool (optional)
        - manual_lb_config (optional, block):
            - control_plane_node_port (optional)
            - ingress_http_node_port (optional)
            - ingress_https_node_port (optional)
            - konnectivity_server_node_port (optional)
        - metal_lb_config (optional, block):
            - address_pools (required, block):
                - addresses (required)
                - avoid_buggy_ips (optional)
                - manual_assign (optional)
                - pool (required)
        - vip_config (optional, block):
            - control_plane_vip (optional)
            - ingress_vip (optional)
    - network_config (block):
        - control_plane_v2_config (optional, block):
            - control_plane_ip_block (optional, block):
                - gateway (optional)
                - ips (optional, block):
                    - hostname (optional)
                    - ip (optional)
                - netmask (optional)
        - dhcp_ip_config (optional, block):
            - enabled (required)
        - host_config (optional, block):
            - dns_search_domains (optional)
            - dns_servers (optional)
            - ntp_servers (optional)
        - pod_address_cidr_blocks (required)
        - service_address_cidr_blocks (required)
        - static_ip_config (optional, block):
            - ip_blocks (required, block):
                - gateway (required)
                - ips (required, block):
                    - hostname (optional)
                    - ip (required)
                - netmask (required)
        - vcenter_network (optional)
    - storage (block):
        - vsphere_csi_disabled (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - upgrade_policy (block):
        - control_plane_only (optional)
    - vcenter (block):
        - ca_cert_data (optional)
        - cluster (optional)
        - datacenter (optional)
        - datastore (optional)
        - folder (optional)
        - resource_pool (optional)
        - storage_policy_name (optional)
EOT

  type = map(object({
    admin_cluster_membership = string
    location                 = string
    name                     = string
    on_prem_version          = string
    annotations              = optional(map(string))
    deletion_policy          = optional(string)
    description              = optional(string)
    disable_bundled_ingress  = optional(bool)
    enable_advanced_cluster  = optional(bool)
    enable_control_plane_v2  = optional(bool)
    project                  = optional(string)
    skip_validations         = optional(list(string))
    vm_tracking_enabled      = optional(bool)
    control_plane_node = object({
      auto_resize_config = optional(object({
        enabled = bool
      }))
      cpus     = optional(number)
      memory   = optional(number)
      replicas = optional(number)
    })
    anti_affinity_groups = optional(object({
      aag_config_disabled = bool
    }))
    authorization = optional(object({
      admin_users = optional(list(object({
        username = string
      })))
    }))
    auto_repair_config = optional(object({
      enabled = bool
    }))
    dataplane_v2 = optional(object({
      advanced_networking          = optional(bool)
      dataplane_v2_enabled         = optional(bool)
      windows_dataplane_v2_enabled = optional(bool)
    }))
    load_balancer = optional(object({
      f5_config = optional(object({
        address   = optional(string)
        partition = optional(string)
        snat_pool = optional(string)
      }))
      manual_lb_config = optional(object({
        control_plane_node_port       = optional(number)
        ingress_http_node_port        = optional(number)
        ingress_https_node_port       = optional(number)
        konnectivity_server_node_port = optional(number)
      }))
      metal_lb_config = optional(object({
        address_pools = list(object({
          addresses       = list(string)
          avoid_buggy_ips = optional(bool)
          manual_assign   = optional(bool)
          pool            = string
        }))
      }))
      vip_config = optional(object({
        control_plane_vip = optional(string)
        ingress_vip       = optional(string)
      }))
    }))
    network_config = optional(object({
      control_plane_v2_config = optional(object({
        control_plane_ip_block = optional(object({
          gateway = optional(string)
          ips = optional(list(object({
            hostname = optional(string)
            ip       = optional(string)
          })))
          netmask = optional(string)
        }))
      }))
      dhcp_ip_config = optional(object({
        enabled = bool
      }))
      host_config = optional(object({
        dns_search_domains = optional(list(string))
        dns_servers        = optional(list(string))
        ntp_servers        = optional(list(string))
      }))
      pod_address_cidr_blocks     = list(string)
      service_address_cidr_blocks = list(string)
      static_ip_config = optional(object({
        ip_blocks = list(object({
          gateway = string
          ips = list(object({
            hostname = optional(string)
            ip       = string
          }))
          netmask = string
        }))
      }))
      vcenter_network = optional(string)
    }))
    storage = optional(object({
      vsphere_csi_disabled = bool
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    upgrade_policy = optional(object({
      control_plane_only = optional(bool)
    }))
    vcenter = optional(object({
      ca_cert_data        = optional(string)
      cluster             = optional(string)
      datacenter          = optional(string)
      datastore           = optional(string)
      folder              = optional(string)
      resource_pool       = optional(string)
      storage_policy_name = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.gkeonprem_vmware_clusters : (
        v.load_balancer == null || (v.load_balancer.metal_lb_config == null || (length(v.load_balancer.metal_lb_config.address_pools) >= 1))
      )
    ])
    error_message = "Each address_pools list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.gkeonprem_vmware_clusters : (
        v.network_config == null || (v.network_config.static_ip_config == null || (length(v.network_config.static_ip_config.ip_blocks) >= 1))
      )
    ])
    error_message = "Each ip_blocks list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.gkeonprem_vmware_clusters : (
        v.network_config == null || (v.network_config.static_ip_config == null || (alltrue([for item in v.network_config.static_ip_config.ip_blocks : (length(item.ips) >= 1)])))
      )
    ])
    error_message = "Each ips list must contain at least 1 items"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

