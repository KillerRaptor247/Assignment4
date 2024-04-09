FROM python:3.12

RUN echo "Copying directory"

COPY ./app /app

RUN echo "installing very cool requirements"

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

RUN echo "done installing requirements"

EXPOSE 8000

RUN echo "exposed 8000"

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

RUN echo "Running Uvicorn COMMAND"