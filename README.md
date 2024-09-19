# OpenAI API Deployment on AWS Lambda

A simple setp to install and deploy an OpenAi Lambda layer using docker. It handles all the setup, dependencies, and pushes the layer to AWS.

## Prerequisites


- Docker.
- AWS account with sufficient permissions to create and manage Lambda layers
- AWS Access Key ID and Secret Access Key

## Getting Started

### Step 1: Clone the repository

```bash
git clone <repository-url>
cd <repository-folder>
```

### Step 2: Build the docker image

```bash
docker build --build-arg AWS_ACCESS_KEY_ID=<your-access-key-id> \
             --build-arg AWS_SECRET_ACCESS_KEY=<your-secret-access-key> \
             --build-arg AWS_DEFAULT_REGION=us-east-1 \
             -t openai-lambda-layer .
```

### Step 3: Run the Docker container to deploy the lambda layer

```bash
docker run -e AWS_ACCESS_KEY_ID=<your-access-key-id> \
           -e AWS_SECRET_ACCESS_KEY=<your-secret-access-key> \
           openai-lambda-layer
```

## Deployment issues

Check the aws cli configuration

```bash
docker run -it openai-lambda-layer aws configure list
```

