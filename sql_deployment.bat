@set "filename=.env"

for /F "delims== tokens=1,* eol=#" %%i in (%filename%) do @set %%i=%%~j

if %SQL_DELETE% EQU true kubectl delete service mysql
if %SQL_DELETE% EQU true kubectl delete deployment mysql

kubectl apply -f ./mysql/mysql-pv.yaml
kubectl apply -f ./mysql/mysql-pvc.yaml

kubectl apply -f ./mysql/mysql-deployment.yaml
kubectl apply -f ./mysql/mysql-service.yaml
