#### Kubernetes cluster provisining steps

https://williamlam.com/2015/11/using-ansible-to-provision-a-kubernetes-cluster-on-vmware-photon.html


    ansible -i hosts_file all -m ping --user root --ask-pass



    ansible-playbook -i hosts_file --user root --ask-pass kubernetes_cluster.yml
