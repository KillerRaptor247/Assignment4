@set "filename=.env"

for /F "delims== tokens=1,* eol=#" %%i in (%filename%) do @set %%i=%%~j

if %BND_REBUILD% EQU true docker image rm backend
if %BND_REBUILD% EQU true docker build -t backend ./fastapi
if %BND_REBUILD% EQU true minikube image load backend

if %BND_DELETE% EQU true kubectl delete service backend
if %BND_DELETE% EQU true kubectl delete deployment backend

kubectl apply -f ./fastapi/fastapi-deployment.yaml
kubectl apply -f ./fastapi/fastapi-service.yaml