FROM python:3.7-slim
MAINTAINER Yusuf Iqbal <yusuf.iqbal@devfactory.com>

RUN apt-get update
RUN apt-get install --no-install-suggests -y groff-base ssh

# Set the application directory
WORKDIR /app

# Install AWS CLI
RUN pip install awscli --upgrade --user
RUN pip install --upgrade pip
ENV PATH=~/.local/bin:$PATH

# Copy code from the current folder to /app inside the container
ADD . /app

RUN cp -r /app/aws/ ~/.aws
