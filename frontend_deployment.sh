docker image rm frontend
docker build -t frontend ./nextjs
minikube image load frontend
kubectl delete service frontend
kubectl delete deployment frontend
kubectl apply -f ./nextjs/nextjs-deployment.yaml
kubectl apply -f ./nextjs/nextjs-service.yaml