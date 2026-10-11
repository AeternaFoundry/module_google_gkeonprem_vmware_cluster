resource "google_gkeonprem_vmware_cluster" "gkeonprem_vmware_clusters" {
  for_each = var.gkeonprem_vmware_clusters

  admin_cluster_membership = each.value.admin_cluster_membership
  location                 = each.value.location
  name                     = each.value.name
  on_prem_version          = each.value.on_prem_version
  annotations              = each.value.annotations
  deletion_policy          = each.value.deletion_policy
  description              = each.value.description
  disable_bundled_ingress  = each.value.disable_bundled_ingress
  enable_advanced_cluster  = each.value.enable_advanced_cluster
  enable_control_plane_v2  = each.value.enable_control_plane_v2
  project                  = each.value.project
  skip_validations         = each.value.skip_validations
  vm_tracking_enabled      = each.value.vm_tracking_enabled

  control_plane_node {
    dynamic "auto_resize_config" {
      for_each = each.value.control_plane_node.auto_resize_config != null ? [each.value.control_plane_node.auto_resize_config] : []
      content {
        enabled = auto_resize_config.value.enabled
      }
    }
    cpus     = each.value.control_plane_node.cpus
    memory   = each.value.control_plane_node.memory
    replicas = each.value.control_plane_node.replicas
  }

  dynamic "anti_affinity_groups" {
    for_each = each.value.anti_affinity_groups != null ? [each.value.anti_affinity_groups] : []
    content {
      aag_config_disabled = anti_affinity_groups.value.aag_config_disabled
    }
  }

  dynamic "authorization" {
    for_each = each.value.authorization != null ? [each.value.authorization] : []
    content {
      dynamic "admin_users" {
        for_each = authorization.value.admin_users != null ? authorization.value.admin_users : []
        content {
          username = admin_users.value.username
        }
      }
    }
  }

  dynamic "auto_repair_config" {
    for_each = each.value.auto_repair_config != null ? [each.value.auto_repair_config] : []
    content {
      enabled = auto_repair_config.value.enabled
    }
  }

  dynamic "dataplane_v2" {
    for_each = each.value.dataplane_v2 != null ? [each.value.dataplane_v2] : []
    content {
      advanced_networking          = dataplane_v2.value.advanced_networking
      dataplane_v2_enabled         = dataplane_v2.value.dataplane_v2_enabled
      windows_dataplane_v2_enabled = dataplane_v2.value.windows_dataplane_v2_enabled
    }
  }

  dynamic "load_balancer" {
    for_each = each.value.load_balancer != null ? [each.value.load_balancer] : []
    content {
      dynamic "f5_config" {
        for_each = load_balancer.value.f5_config != null ? [load_balancer.value.f5_config] : []
        content {
          address   = f5_config.value.address
          partition = f5_config.value.partition
          snat_pool = f5_config.value.snat_pool
        }
      }
      dynamic "manual_lb_config" {
        for_each = load_balancer.value.manual_lb_config != null ? [load_balancer.value.manual_lb_config] : []
        content {
          control_plane_node_port       = manual_lb_config.value.control_plane_node_port
          ingress_http_node_port        = manual_lb_config.value.ingress_http_node_port
          ingress_https_node_port       = manual_lb_config.value.ingress_https_node_port
          konnectivity_server_node_port = manual_lb_config.value.konnectivity_server_node_port
        }
      }
      dynamic "metal_lb_config" {
        for_each = load_balancer.value.metal_lb_config != null ? [load_balancer.value.metal_lb_config] : []
        content {
          dynamic "address_pools" {
            for_each = metal_lb_config.value.address_pools
            content {
              addresses       = address_pools.value.addresses
              avoid_buggy_ips = address_pools.value.avoid_buggy_ips
              manual_assign   = address_pools.value.manual_assign
              pool            = address_pools.value.pool
            }
          }
        }
      }
      dynamic "vip_config" {
        for_each = load_balancer.value.vip_config != null ? [load_balancer.value.vip_config] : []
        content {
          control_plane_vip = vip_config.value.control_plane_vip
          ingress_vip       = vip_config.value.ingress_vip
        }
      }
    }
  }

  dynamic "network_config" {
    for_each = each.value.network_config != null ? [each.value.network_config] : []
    content {
      dynamic "control_plane_v2_config" {
        for_each = network_config.value.control_plane_v2_config != null ? [network_config.value.control_plane_v2_config] : []
        content {
          dynamic "control_plane_ip_block" {
            for_each = control_plane_v2_config.value.control_plane_ip_block != null ? [control_plane_v2_config.value.control_plane_ip_block] : []
            content {
              gateway = control_plane_ip_block.value.gateway
              dynamic "ips" {
                for_each = control_plane_ip_block.value.ips != null ? control_plane_ip_block.value.ips : []
                content {
                  hostname = ips.value.hostname
                  ip       = ips.value.ip
                }
              }
              netmask = control_plane_ip_block.value.netmask
            }
          }
        }
      }
      dynamic "dhcp_ip_config" {
        for_each = network_config.value.dhcp_ip_config != null ? [network_config.value.dhcp_ip_config] : []
        content {
          enabled = dhcp_ip_config.value.enabled
        }
      }
      dynamic "host_config" {
        for_each = network_config.value.host_config != null ? [network_config.value.host_config] : []
        content {
          dns_search_domains = host_config.value.dns_search_domains
          dns_servers        = host_config.value.dns_servers
          ntp_servers        = host_config.value.ntp_servers
        }
      }
      pod_address_cidr_blocks     = network_config.value.pod_address_cidr_blocks
      service_address_cidr_blocks = network_config.value.service_address_cidr_blocks
      dynamic "static_ip_config" {
        for_each = network_config.value.static_ip_config != null ? [network_config.value.static_ip_config] : []
        content {
          dynamic "ip_blocks" {
            for_each = static_ip_config.value.ip_blocks
            content {
              gateway = ip_blocks.value.gateway
              dynamic "ips" {
                for_each = ip_blocks.value.ips
                content {
                  hostname = ips.value.hostname
                  ip       = ips.value.ip
                }
              }
              netmask = ip_blocks.value.netmask
            }
          }
        }
      }
      vcenter_network = network_config.value.vcenter_network
    }
  }

  dynamic "storage" {
    for_each = each.value.storage != null ? [each.value.storage] : []
    content {
      vsphere_csi_disabled = storage.value.vsphere_csi_disabled
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "upgrade_policy" {
    for_each = each.value.upgrade_policy != null ? [each.value.upgrade_policy] : []
    content {
      control_plane_only = upgrade_policy.value.control_plane_only
    }
  }

  dynamic "vcenter" {
    for_each = each.value.vcenter != null ? [each.value.vcenter] : []
    content {
      ca_cert_data        = vcenter.value.ca_cert_data
      cluster             = vcenter.value.cluster
      datacenter          = vcenter.value.datacenter
      datastore           = vcenter.value.datastore
      folder              = vcenter.value.folder
      resource_pool       = vcenter.value.resource_pool
      storage_policy_name = vcenter.value.storage_policy_name
    }
  }
}

