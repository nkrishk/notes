https://docs.ansible.com/ansible/2.6/vmware/scenario_clone_template.html

```
---
- name: Create a VM from a template 
  hosts: localhost
  connection: local
  gather_facts: no
  tasks:
  - name: Clone the template
    vmware_guest:
      hostname: 10.78.229.250
      username: administrator@vsphere.local
      password: vmware
      validate_certs: False
      name: testvm_2
      template: template_el7
      datacenter: DC1
      folder: /DC1/vm
      state: poweredon
      wait_for_ip_address: yes
```

https://www.virtualizationhowto.com/2020/07/ansible-deploy-multiple-vm-from-template-vmware/

```
---

- name: Clone multiple VMs
  hosts: localhost 
  gather_facts: false
  vars_files: 
    multiple_vms.yml
  tasks: 
  - name: Clone multiple VMs from template
    local_action:
      module: vmware_guest
      hostname: "{{ vcenter_hostname }}"
      username: "{{ username }}"
      password: "{{ password }}"
      validate_certs: no      
      folder: "{{ folder }}"
      template: "{{ vmtemplate }}"
      name: "{{ item }}"
      cluster: "{{ vmcluster }}"
      datacenter: CloudLocal
      state: poweredon
      customization_spec: "{{ customization_spec }}"
    with_items: "{{ servers }}"
```
variable file 

```
---
vcenter_hostname: <FQDN or IP of your vCenter Server>
username: administrator@vsphere.local
password: <your password>
folder: testansible
datastore: vsanDatastore
vmtemplate: Win2019clone
customization_spec: <your customization spec>
vmcluster: vsancluster
servers:
  - test19_01
  - test19_02
```
