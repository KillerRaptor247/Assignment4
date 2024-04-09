@set "filename=.env"

for /F "delims== tokens=1,* eol=#" %%i in (%filename%) do @set %%i=%%~j

git clone %REPO% kubernetes_deploy
cd kubernetes_deploy
git checkout %BRANCH%
git pull origin %BRANCH%

if %RESTART_MINIKUBE% EQU true minikube start --driver=docker

docker context use default

if %DELETE_PODS% EQU true kubectl delete --all pod
if %DELETE_PODS% EQU true kubectl delete --all pvc
if %DELETE_PODS% EQU true kubectl delete --all pv



echo sql deployment starting
call sql_deployment.bat
echo sql deployment complete

echo backend deployment starting
call backend_deployment.bat
echo backend deployment complete

echo frontend deployment starting
call frontend_deployment.bat
echo frontend deployment complete