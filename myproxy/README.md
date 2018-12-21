Make k8s-api-proxy.sh executable:

chmod +x k8s-api-proxy.sh

Build and push the container to your project. For [YOUR_PROJECT], substitute the ID of your project.

docker build -t gcr.io/[YOUR_PROJECT]/k8s-api-proxy:0.1 .

docker push gcr.io/[YOUR_PROJECT]/k8s-api-proxy:0.1

Create a Kubernetes deployment that exposes the container that you just created. For [YOUR_PROJECT], use your project ID.

kubectl run k8s-api-proxy \
    --image=gcr.io/[YOUR_PROJECT]/k8s-api-proxy:0.1 \
    --port=8118
    
    
