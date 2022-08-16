FROM python:3.8-slim-buster

WORKDIR /usr/src/predgpi

COPY /bin/requirements.txt .

RUN python -m pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt  

RUN apt-get -qq update --fix-missing && \
    apt-get install -y \
    git

WORKDIR /setup/

RUN git clone https://github.com/BolognaBiocomp/predgpi.git \
  && cd predgpi \
  && cp -r GPIDAT /usr/src/predgpi \
  && cp -r predgpilib /usr/src/predgpi \
  && cp predgpi.py /usr/src/predgpi \
  && cd /setup \
  && rm -rf predgpi

WORKDIR /data/

ENV PREDGPI_HOME='/usr/src/predgpi' PATH=/usr/src/predgpi:$PATH

ENTRYPOINT ["/usr/src/predgpi/predgpi.py"]
