#### copy vs template modeule

https://www.redhat.com/sysadmin/ansibles-copy-template-modules

    ansible-playbook -i inventory.yml copy.yml

    ansible-playbook -i inventory.yml template.yml
    
```
$ tree
.
├── copy.yml
├── files
│   └── etc
│       └── motd
├── inventory.yml
├── templates
│   └── etc
│       └── keepalived
│           └── keepalived.conf.j2
└── template.yml

5 directories, 5 files
```

#### 
