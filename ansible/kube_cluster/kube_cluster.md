#### Kubernetes cluster provisining steps

https://williamlam.com/2015/11/using-ansible-to-provision-a-kubernetes-cluster-on-vmware-photon.html


    ansible -i hosts_file all -m ping --user root --ask-pass



    ansible-playbook -i hosts_file --user root --ask-pass kubernetes_cluster.yml
    
    
If you want to use SSH keys for authentication and if you have already uploaded the public keys to your Photon VMs, then you can replace ```--ask-pass``` with ```--private-key``` and specify the full path to your SSH private keys.
