#minikube start --driver=docker
docker context use default

echo sql deployment starting
call sql_deployment.bat
echo sql deployment complete

echo backend deployment starting
call backend_deployment.bat
echo backend deployment complete

echo frontend deployment starting
call frontend_deployment.bat
echo frontend deployment complete