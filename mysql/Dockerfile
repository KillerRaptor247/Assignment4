# Use the official MySQL image as the base
FROM sakiladb/mysql:8
ENV MYSQL_ROOT_PASSWORD=password

# Set the working directory to /docker-entrypoint-initdb.d, which is a special directory in the MySQL image
ADD . /docker-entrypoint-initdb.d

# The MySQL image will automatically execute SQL scripts in /docker-entrypoint-initdb.d when the container starts

EXPOSE 3306
