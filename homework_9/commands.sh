# create a cluster
k3d cluster create kube4 -p "80:80@loadbalancer" -a 1 -s 1

# add 127.26.0.2 ver1.203007.com & 127.26.0.4 ver2.203007.com
# into the hosts file in /etc

# deploy 2 pods, and 2 services for the 2 versions of the images
kubectl apply -f app.yml

# deploy the ingress manifest
kubectl apply -f k3ing-complex.yml

# delete the cluster
k3d cluster delete kube4
