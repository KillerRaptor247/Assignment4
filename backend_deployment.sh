docker image rm backend
docker build -t backend ./fastapi
minikube image load backend
kubectl delete service backend
kubectl delete deployment backend
kubectl apply -f ./fastapi/fastapi-deployment.yaml
kubectl apply -f ./fastapi/fastapi-service.yaml