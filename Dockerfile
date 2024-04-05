FROM python:3.7-alpine AS build
RUN apk add --no-cache python3-dev py3-pip build-base gcc musl-dev postgresql-dev \
    && pip3 install --upgrade pip
WORKDIR /app
COPY . /app
RUN python -m pip install -r requirements.txt

FROM build AS final
EXPOSE 5000
ENTRYPOINT /bin/sh entrypoint.sh