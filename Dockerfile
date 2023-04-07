# Используйте образ Python 3.9 в качестве основы
FROM python:3.9-slim-buster

# Установите зависимости из файла requirements.txt
COPY requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt

# Копируйте все файлы приложения в Docker-контейнер
COPY . /app

# Установите переменную среды для Flask
ENV FLASK_APP=app.py

# Откройте порт, который будет использоваться для приложения Flask
EXPOSE 5000

# Запустите приложение Flask
CMD ["flask", "run", "--host=0.0.0.0"]