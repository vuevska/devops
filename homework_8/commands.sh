# building a nginx image with tag 1.0
docker build -t vuevska/homework8-image:1.0 .

# pushing it to DockerHub
docker push vuevska/homework8-image:1.0

# creating the cluster
k3d cluster create -a 1 -s 1 kube3

# deploying the Deployment manifest to the cluster
kubectl apply -f deploy.yml

# building the same ngninx image with tag 2.0
docker build -t vuevska/homework8-image:2.0 .

# pushing it to Dockerhub
docker push vuevska/homework8-image:2.0

# deploying the Deployment with tag 2.0
kubectl apply -f deploy.yml

# reverting to the 1.0 version
kubectl rollout undo deployment homework8-image --to-revision=1

# deleting the cluster 
k3d cluster delete kube3
