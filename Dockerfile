FROM python:3.8-slim-buster

WORKDIR /usr/src/predgpi

COPY /bin/requirements.txt .

RUN python -m pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt  
    
COPY /bin/ .

WORKDIR /data/

ENV PREDGPI_HOME='/usr/src/predgpi' PATH=/usr/src/predgpi:$PATH

ENTRYPOINT ["/usr/src/predgpi/predgpi.py"]
