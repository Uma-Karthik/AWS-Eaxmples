## create a bucket

aws s3 mb s3://my-policy-example-uk234

aws s3api put-bucket-policy --bucket my-policy-example-uk234 --policy file://policy.json
