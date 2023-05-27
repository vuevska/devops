# checking if k3d is installed
k3d version

# checking if kubectl is installed
kubectl version

k3d cluster create -s 3 -a 5 clustername
# -s server/control plane nodes
# -a agent/worker nodes

# show all clusters
k3d cluster list

# show all nodes in the complex cluster
kubectl get nodes

# show all pods
kubectl get pods

# show all pods in all namespaces
kubectl get pods --all-namespaces

# deleting the cluster
k3d cluster delete clustername

