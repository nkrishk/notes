
#### fetch logs - last week - last 5 minutes etc

    https://stackoverflow.com/questions/60630300/clear-a-pods-log-in-kubernetes


#### -h for help
`kubectl logs -help`

#### List all pods
`kubectl get pods -A`
- only selected name space

kubectl get pods -o wide                      # List all pods in the current namespace, with more details


`kubectl get pods -n <NAMESPACE_NAME>`

#### Describe POD
Describe no of containers and other data

`kubectl describe pods -n <NAMESPACE_NAME> <POD_NAME>`

#### Logs
`kubectl logs -n <NAMESPACE_NAME> <POD_NAME> -f`

-f - option to dispalay continuously

#### Get into the CONTAINER machine
get into default continer
`kubectl exec -it -n <NAMESPACE_NAME> <POD_NAME> --/bin/sh`

`kubectl exec -it -n <NAMESPACE_NAME> <POD_NAME> -c <CONTAINER_NAME> --/bin/sh`




why diffrent namespace ?

why junk characters at pod end?
