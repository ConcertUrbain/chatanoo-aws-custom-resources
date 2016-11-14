#!/bin/bash

echo "Deploy $TRAVIS_TAG version to S3"
aws s3 cp infra/resources.cfn.yml s3://chatanoo-deployments-eu-west-1/infra/resources/$TRAVIS_TAG.cfn.yml

echo "Upload latest"
aws s3api put-object \
  --bucket chatanoo-deployments-eu-west-1 \
  --key infra/resources/latest.cfn.yml \
  --website-redirect-location /infra/resources/$TRAVIS_TAG.cfn.yml
