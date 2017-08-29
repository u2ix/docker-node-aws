FROM node:8.4.0


RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    zip unzip \
    python-dev \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /tmp

RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
RUN unzip awscli-bundle.zip
RUN ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

WORKDIR /


ENV PATH="~/bin:${PATH}"
