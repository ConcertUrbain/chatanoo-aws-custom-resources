#!/bin/bash

echo "Deploy $TRAVIS_TAG version to S3"
aws s3 cp infra/resources.cform s3://chatanoo-deployment/infra/resources/$TRAVIS_TAG.cform

echo "Upload latest"
aws s3api put-object --bucket chatanoo-deployment --key infra/resources/latest.cform --metadata WebsiteRedirectLocation=/infra/resources/$TRAVIS_TAG.cform
