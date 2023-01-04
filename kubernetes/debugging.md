
    kubectl get pods -n opshub-data | grep auth

    kubectl get deployment -n opshub-data

    kubectl get events -n opshub-data

    kubectl get pods -n opshub-data | grep "ops-center-opshub-data-ops-center"
    
    curl -u admin:CiscoChn123* 10.99.14.231:8080/auth -v         <use ip>
    
    kubectl logs -n opshub-data -l component=ops-center

    kubectl logs -n opshub-data -l component=ops-center --all-containers

    kubectl get endpoints -n opshub-data
    
    kubectl delete pod -n opshub-data -l component=ops-center.  <get ip>

    kubectl describe pod -n inode-manager-data -l component=ops-center
    
    kubectl get pods -n inode-manager-data -o wide | grep ops-ce

    docker images | grep <image tag>
    
    kubectl delete pod -n inode-manager-data -l component=ops-center

    kubectl get pods -n inode-manager-data -o wide | grep ops

    kubectl label nodes <infra-1 node name> nodename=infra-1      ->       kubectl get nodes
    
    kubectl edit deployment/ops-center-inode-manager-data-ops-center -n inode-manager-data 
    
    ./affinity
    
                  - key: nodename
                operator: In
                values:
                - infra-1

    kubectl get pods -n inode-manager-data -o wide
