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
