# Kubenetws

[Kubernetes 101: Pods, Nodes, Containers, and Clusters](https://medium.com/google-cloud/kubernetes-101-pods-nodes-containers-and-clusters-c1509e409e16)

## Pods



[How to Delete Pods from a Kubernetes Node](https://www.bluematador.com/blog/safely-removing-pods-from-a-kubernetes-node)

## Service

A Service enables **network access to a set of Pods** in Kubernetes.

Services select Pods based on their **labels**. When a network request is made to the service, it selects all Pods in the cluster matching the service's selector, chooses one of them, and forwards the network request to it.

## Service vs Deployment

A deployment is responsible for **keeping a set of pods running**. 

A service is responsible for **enabling network access to a set of pods**.











## Reference

[Service - Kubernetes Guide with Examples](https://matthewpalmer.net/kubernetes-app-developer/articles/service-kubernetes-example-tutorial.html)

