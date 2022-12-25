https://docs.ansible.com/ansible/latest/collections/community/vmware/vmware_host_module.html

#### Add, remove, or move an ESXi host to, from, or within vCenter

```
- name: Add ESXi Host to vCenter
  community.vmware.vmware_host:
    hostname: '{{ vcenter_hostname }}'
    username: '{{ vcenter_username }}'
    password: '{{ vcenter_password }}'
    datacenter: datacenter_name
    cluster: cluster_name
    esxi_hostname: '{{ esxi_hostname }}'
    esxi_username: '{{ esxi_username }}'
    esxi_password: '{{ esxi_password }}'
    state: present
  delegate_to: localhost

- name: Add ESXi Host to vCenter under a specific folder
  community.vmware.vmware_host:
    hostname: '{{ vcenter_hostname }}'
    username: '{{ vcenter_username }}'
    password: '{{ vcenter_password }}'
    datacenter: datacenter_name
    folder: '/Site2/Asia-Cluster/host'
    esxi_hostname: '{{ esxi_hostname }}'
    esxi_username: '{{ esxi_username }}'
    esxi_password: '{{ esxi_password }}'
    state: present
    add_connected: True
  delegate_to: localhost

- name: Reconnect ESXi Host (with username/password set)
  community.vmware.vmware_host:
    hostname: '{{ vcenter_hostname }}'
    username: '{{ vcenter_username }}'
    password: '{{ vcenter_password }}'
    datacenter: datacenter_name
    cluster: cluster_name
    esxi_hostname: '{{ esxi_hostname }}'
    esxi_username: '{{ esxi_username }}'
    esxi_password: '{{ esxi_password }}'
    state: reconnect
  delegate_to: localhost

- name: Reconnect ESXi Host (with default username/password)
  community.vmware.vmware_host:
    hostname: '{{ vcenter_hostname }}'
    username: '{{ vcenter_username }}'
    password: '{{ vcenter_password }}'
    datacenter: datacenter_name
    cluster: cluster_name
    esxi_hostname: '{{ esxi_hostname }}'
    state: reconnect
  delegate_to: localhost

- name: Add ESXi Host with SSL Thumbprint to vCenter
  community.vmware.vmware_host:
    hostname: '{{ vcenter_hostname }}'
    username: '{{ vcenter_username }}'
    password: '{{ vcenter_password }}'
    datacenter: datacenter_name
    cluster: cluster_name
    esxi_hostname: '{{ esxi_hostname }}'
    esxi_username: '{{ esxi_username }}'
    esxi_password: '{{ esxi_password }}'
    esxi_ssl_thumbprint: "3C:A5:60:6F:7A:B7:C4:6C:48:28:3D:2F:A5:EC:A3:58:13:88:F6:DD"
    state: present
  delegate_to: localhost
  ```
  
