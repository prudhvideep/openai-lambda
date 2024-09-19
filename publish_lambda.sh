#!/bin/bash

if [ -z "$AWS_COMPATIBLE_RUNTIME" ]; then
    echo "Error: AWS_COMPATIBLE_RUNTIME is not set"
    exit 1
fi

aws lambda publish-layer-version \
    --layer-name openai-lambda-docker \
    --zip-file fileb://openai-lambda-layer.zip \
    --compatible-runtimes $AWS_COMPATIBLE_RUNTIME

echo "Lambda layer published successfully"