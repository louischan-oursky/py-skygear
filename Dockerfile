FROM python:3.4

RUN \
    wget https://github.com/Yelp/dumb-init/releases/download/v1.0.0/dumb-init_1.0.0_amd64.deb && \
    dpkg -i dumb-init_*.deb && \
    rm dumb-init_*.deb

RUN pip install --upgrade pip && \
    pip install --upgrade setuptools

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ENV PYTHONUNBUFFERED 0
ENTRYPOINT ["dumb-init"]

COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt
COPY . /usr/src/app
