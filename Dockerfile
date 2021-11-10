FROM python:3.8-slim


COPY ./app /app
COPY ./entrypoint.sh/ entrypoint.sh
COPY ./requirements.txt /requirements.txt

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        python3-dev \
        python3-setuptools \
        tesseract-orc \
        make \
        gcc \
    python3 -m pip install -r requirements.txt \
    && apt-get remove -y --purge make gcc bui;d-essential \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN chmod +x entrypoint.sh

CMD ["./entrypoint.sh"]
