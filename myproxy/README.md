Make k8s-api-proxy.sh executable:

chmod +x k8s-api-proxy.sh

Build and push the container to your project. For [YOUR_PROJECT], substitute the ID of your project.

docker build -t gcr.io/[YOUR_PROJECT]/k8s-api-proxy:0.1 .

docker push gcr.io/[YOUR_PROJECT]/k8s-api-proxy:0.1

Create a Kubernetes deployment that exposes the container that you just created. For [YOUR_PROJECT], use your project ID.

kubectl run k8s-api-proxy \
    --image=gcr.io/[YOUR_PROJECT]/k8s-api-proxy:0.1 \
    --port=8118
    
kubectl create -f ilb.yaml    

kubectl get service/k8s-api-proxy

gcloud container clusters list

To verify that the proxy is usable, create a Compute Engine instance in the same network, access it with SSH, and verify the proxy. For [YOUR_SUBNET], [YOUR_PROXY] and [MASTER_IP], use the values that you got previously.

gcloud compute instances create \
    --subnet=[YOUR_SUBNET] proxy-test
    
gcloud compute ssh proxy-test -- \
    curl -x [YOUR_PROXY]:8118 https://[MASTER_IP]/api
    
export https_proxy=[YOUR_PROXY]:8118

kubectl get pods
