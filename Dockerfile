FROM ubuntu

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_DEFAULT_REGION=us-east-1
ARG AWS_COMPATIBLE_RUNTIME

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl unzip zip less python3-pip && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    mkdir python && \
    cd python && \
    pip install openai -t . && \
    cd .. && \
    zip -r openai-lambda-layer.zip python

RUN aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID} && \
    aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY} && \
    aws configure set region ${AWS_DEFAULT_REGION}

COPY publish_lambda.sh /publish_lambda.sh
RUN chmod +x /publish_lambda.sh

ENTRYPOINT ["/publish_lambda.sh"]
