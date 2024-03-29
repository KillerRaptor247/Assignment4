# 
FROM python:3.12

# 
WORKDIR /app

# Add the current directory contents into the container at /app
ADD . /app

# 
RUN pip install --no-cache-dir --upgrade -r requirements.txt

EXPOSE 8000

# Docker-compose will override this command
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

