FROM alpine:latest

FROM python:3.7.13-alpine3.16

RUN mkdir -p /app/tests && mkdir -p /app/logs
COPY ./tests /app/tests
COPY .gitignore Dockerfile README.md requirements.txt /app
WORKDIR /app

RUN apk update && \
apk add build-base && \
apk add libffi-dev && \
python -m pip install --user virtualenv && \
python -m virtualenv ./flask_env && \
wget "https://github.com/mozilla/geckodriver/releases/download/v0.31.0/geckodriver-v0.31.0-linux32.tar.gz" -O "geckodriver.tar.gz" && \
tar -xvzf geckodriver.tar.gz -C ./flask_env/bin/ && \
./flask_env/bin/pip install -r requirements.txt && \
chmod +x ./flask_env/bin/ && \
source ./flask_env/bin/activate
ENV PATH="./flask_env/bin/:$PATH"

CMD ["sh", "-c"]