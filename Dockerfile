FROM python:3.9

WORKDIR /app


COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV DEBUG=False
ENV PYTHONUNBUFFERED=1
RUN python manage.py collectstatic --noinput
EXPOSE 8000

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
