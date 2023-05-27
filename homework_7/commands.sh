# building the Docker image from Dockerfile
docker build -t vuevska/my-ngninx-image:1.0 .

# pushing the image to DockerHub
docker push vuevska/my-nginx-image:1.0

# creating a cluster
k3d cluster create kube2

# deploying the pod to the cluster
# the pod has a manifest --> my-nginx-pod.yml
# this is the declarative way of deploying it
kubectl apply -f my-nginx-pod.yaml

# showing the pods
kubectl get pods

# showing the pods as they are deploying
kubectl get pods --watch

# detailed report of the pod specs
kubectl describe pods my-nginx-pod

# deleting the cluster
k3d cluster delete kube2
