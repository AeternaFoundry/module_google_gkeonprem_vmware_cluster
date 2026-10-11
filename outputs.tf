output "gkeonprem_vmware_clusters_id" {
  description = "Map of id values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no id are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.id if v.id != null && length(v.id) > 0 }
}
output "gkeonprem_vmware_clusters_admin_cluster_membership" {
  description = "Map of admin_cluster_membership values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no admin_cluster_membership are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.admin_cluster_membership if v.admin_cluster_membership != null && length(v.admin_cluster_membership) > 0 }
}
output "gkeonprem_vmware_clusters_annotations" {
  description = "Map of annotations values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no annotations are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.annotations if v.annotations != null && length(v.annotations) > 0 }
}
output "gkeonprem_vmware_clusters_anti_affinity_groups" {
  description = "Map of anti_affinity_groups values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no anti_affinity_groups are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => one(v.anti_affinity_groups) if v.anti_affinity_groups != null && length(v.anti_affinity_groups) > 0 }
}
output "gkeonprem_vmware_clusters_authorization" {
  description = "Map of authorization values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no authorization are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => one(v.authorization) if v.authorization != null && length(v.authorization) > 0 }
}
output "gkeonprem_vmware_clusters_auto_repair_config" {
  description = "Map of auto_repair_config values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no auto_repair_config are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => one(v.auto_repair_config) if v.auto_repair_config != null && length(v.auto_repair_config) > 0 }
}
output "gkeonprem_vmware_clusters_control_plane_node" {
  description = "Map of control_plane_node values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no control_plane_node are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => one(v.control_plane_node) if v.control_plane_node != null && length(v.control_plane_node) > 0 }
}
output "gkeonprem_vmware_clusters_create_time" {
  description = "Map of create_time values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no create_time are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "gkeonprem_vmware_clusters_dataplane_v2" {
  description = "Map of dataplane_v2 values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no dataplane_v2 are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => one(v.dataplane_v2) if v.dataplane_v2 != null && length(v.dataplane_v2) > 0 }
}
output "gkeonprem_vmware_clusters_delete_time" {
  description = "Map of delete_time values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no delete_time are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.delete_time if v.delete_time != null && length(v.delete_time) > 0 }
}
output "gkeonprem_vmware_clusters_deletion_policy" {
  description = "Map of deletion_policy values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no deletion_policy are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "gkeonprem_vmware_clusters_description" {
  description = "Map of description values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no description are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.description if v.description != null && length(v.description) > 0 }
}
output "gkeonprem_vmware_clusters_disable_bundled_ingress" {
  description = "Map of disable_bundled_ingress values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no disable_bundled_ingress are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.disable_bundled_ingress if v.disable_bundled_ingress != null }
}
output "gkeonprem_vmware_clusters_effective_annotations" {
  description = "Map of effective_annotations values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no effective_annotations are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.effective_annotations if v.effective_annotations != null && length(v.effective_annotations) > 0 }
}
output "gkeonprem_vmware_clusters_enable_advanced_cluster" {
  description = "Map of enable_advanced_cluster values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no enable_advanced_cluster are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.enable_advanced_cluster if v.enable_advanced_cluster != null }
}
output "gkeonprem_vmware_clusters_enable_control_plane_v2" {
  description = "Map of enable_control_plane_v2 values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no enable_control_plane_v2 are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.enable_control_plane_v2 if v.enable_control_plane_v2 != null }
}
output "gkeonprem_vmware_clusters_endpoint" {
  description = "Map of endpoint values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no endpoint are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.endpoint if v.endpoint != null && length(v.endpoint) > 0 }
}
output "gkeonprem_vmware_clusters_etag" {
  description = "Map of etag values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no etag are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.etag if v.etag != null && length(v.etag) > 0 }
}
output "gkeonprem_vmware_clusters_fleet" {
  description = "Map of fleet values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no fleet are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.fleet if v.fleet != null && length(v.fleet) > 0 }
}
output "gkeonprem_vmware_clusters_load_balancer" {
  description = "Map of load_balancer values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no load_balancer are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => one(v.load_balancer) if v.load_balancer != null && length(v.load_balancer) > 0 }
}
output "gkeonprem_vmware_clusters_local_name" {
  description = "Map of local_name values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no local_name are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.local_name if v.local_name != null && length(v.local_name) > 0 }
}
output "gkeonprem_vmware_clusters_location" {
  description = "Map of location values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no location are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.location if v.location != null && length(v.location) > 0 }
}
output "gkeonprem_vmware_clusters_name" {
  description = "Map of name values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no name are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.name if v.name != null && length(v.name) > 0 }
}
output "gkeonprem_vmware_clusters_network_config" {
  description = "Map of network_config values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no network_config are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => one(v.network_config) if v.network_config != null && length(v.network_config) > 0 }
}
output "gkeonprem_vmware_clusters_on_prem_version" {
  description = "Map of on_prem_version values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no on_prem_version are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.on_prem_version if v.on_prem_version != null && length(v.on_prem_version) > 0 }
}
output "gkeonprem_vmware_clusters_project" {
  description = "Map of project values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no project are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.project if v.project != null && length(v.project) > 0 }
}
output "gkeonprem_vmware_clusters_reconciling" {
  description = "Map of reconciling values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no reconciling are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.reconciling if v.reconciling != null }
}
output "gkeonprem_vmware_clusters_skip_validations" {
  description = "Map of skip_validations values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no skip_validations are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.skip_validations if v.skip_validations != null && length(v.skip_validations) > 0 }
}
output "gkeonprem_vmware_clusters_state" {
  description = "Map of state values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no state are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.state if v.state != null && length(v.state) > 0 }
}
output "gkeonprem_vmware_clusters_status" {
  description = "Map of status values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no status are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.status if v.status != null && length(v.status) > 0 }
}
output "gkeonprem_vmware_clusters_storage" {
  description = "Map of storage values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no storage are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => one(v.storage) if v.storage != null && length(v.storage) > 0 }
}
output "gkeonprem_vmware_clusters_uid" {
  description = "Map of uid values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no uid are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.uid if v.uid != null && length(v.uid) > 0 }
}
output "gkeonprem_vmware_clusters_update_time" {
  description = "Map of update_time values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no update_time are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}
output "gkeonprem_vmware_clusters_upgrade_policy" {
  description = "Map of upgrade_policy values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no upgrade_policy are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => one(v.upgrade_policy) if v.upgrade_policy != null && length(v.upgrade_policy) > 0 }
}
output "gkeonprem_vmware_clusters_validation_check" {
  description = "Map of validation_check values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no validation_check are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.validation_check if v.validation_check != null && length(v.validation_check) > 0 }
}
output "gkeonprem_vmware_clusters_vcenter" {
  description = "Map of vcenter values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no vcenter are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => one(v.vcenter) if v.vcenter != null && length(v.vcenter) > 0 }
}
output "gkeonprem_vmware_clusters_vm_tracking_enabled" {
  description = "Map of vm_tracking_enabled values across all gkeonprem_vmware_clusters, keyed the same as var.gkeonprem_vmware_clusters except keys with no vm_tracking_enabled are omitted"
  value       = { for k, v in google_gkeonprem_vmware_cluster.gkeonprem_vmware_clusters : k => v.vm_tracking_enabled if v.vm_tracking_enabled != null }
}

