# Requirements Overview
Consider the .env and the .bats to be Assignment04-Builder, and the rest of the project contained in the rest of the folders to be Assignment04-Production. mysql contains the database, nextjs the frontend, and fastapi the backend. Each one is deployed individually in the appropriately named file. `deploy.bat` starts minikube, clones the appropriate branch from the repository, then calls each of the other deployment files in sequence. The .env file determines whether to completely rebuild the docker images for the frontend, backend, and database respectively. Additionally there is an option to delete volumes, services, and deployments for each of them respectively. Lastly there are options of whether to restart minikube, delete all pods, and which repository and branch to pull from. 

# How to deploy
Simply run `deploy.bat` file

To extract the deployed process from the kubernetes cluster, run the following commands in two separate command lines:

Port forward the frontend to run on localhost:3000
```bash
kubectl port-forward nextjs-POD_NAME 3000:3000
```

Port forward the backend to run on localhost:8000
```bash
kubectl port-forward myapp-POD_NAME 8000:8000
```

Go to localhost:3000, and you should see a table displaying the desired data

## If an error occurs
Cancel the process and run the following commands in sequence, then try to run `deploy.bat` again
```bash
kubectl delete --all all
```
```bash
kubectl delete --all pvc
```
```bash
kubectl delete --all pv
```
