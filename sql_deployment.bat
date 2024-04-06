# kubectl delete pvc mysql-pv-claim
# kubectl delete pv mysql-pv

kubectl delete service mysql
kubectl delete deployment mysql

kubectl apply -f ./mysql/mysql-pv.yaml
kubectl apply -f ./mysql/mysql-pvc.yaml

kubectl apply -f ./mysql/mysql-deployment.yaml
kubectl apply -f ./mysql/mysql-service.yaml
