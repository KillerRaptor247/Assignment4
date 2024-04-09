@set "filename=.env"

for /F "delims== tokens=1,* eol=#" %%i in (%filename%) do @set %%i=%%~j

if %FND_REBUILD% EQU true docker image rm frontend
if %FND_REBUILD% EQU true docker build -t frontend ./nextjs
if %FND_REBUILD% EQU true minikube image load frontend

if %FND_DELETE% EQU true kubectl delete service frontend
if %FND_DELETE% EQU true kubectl delete deployment frontend

kubectl apply -f ./nextjs/nextjs-deployment.yaml
kubectl apply -f ./nextjs/nextjs-service.yaml