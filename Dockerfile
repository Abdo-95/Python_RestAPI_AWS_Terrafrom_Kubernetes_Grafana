FROM python:3.9-alpine
COPY  ./src /app
WORKDIR /app
RUN pip install flask pymysql
ENV PORT "8080"
ENV default_db_ip "34.159.3.127"
ENV default_db_user "pexon-training"
ENV default_db_password "pexon-training2022!"
ENV default_db_name "books"
ENV db_charset "utf8mb4"
EXPOSE 8080
RUN pip install -U python-dotenv
CMD ["python", "app.py"]