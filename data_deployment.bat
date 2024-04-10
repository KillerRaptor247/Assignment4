echo initializing sql container, please wait...
timeout /t 30 /no-break

kubectl get pods -l app=mysql -o custom-columns=:metadata.name --no-headers > mysql_tmp.tmp

set /p MYSQL_POD_NAME=<mysql_tmp.tmp
echo %MYSQL_POD_NAME%
kubectl exec -i %MYSQL_POD_NAME% -- mysql -u root --password="password" < mysql/01-sakila-schema.sql
kubectl exec -i %MYSQL_POD_NAME% -- mysql -u root --password="password" < mysql/02-sakila-data.sql
del mysql_tmp.tmp


echo finished initializing sql container!