## create website 1
## create a bucket
aws s3 mb s3://cors-new-example

## change block public access
aws s3api put-public-access-block \
--bucket cors-new-example \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"

## create a bucket policy
aws s3api put-bucket-policy --bucket cors-new-example --policy file://bucket-policy.json

## Turn on Static Website Hostiing
aws s3api put-bucket-website --bucket cors-new-example --website-configuration file://website.json

## Upload our index.html file and include a resource that would be cross-origin
aws s3 cp index.html s3://cors-new-example

## View the website and see if the index.html is there.
http://cors-new-example.s3-website.us-east-1.amazonaws.com


## create website 
## create a bucket
aws s3 mb s3://cors-new-example2

## change block public access
aws s3api put-public-access-block \
--bucket cors-new-example2 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"

## create a bucket policy
aws s3api put-bucket-policy --bucket cors-new-example2 --policy file://bucket-policy2.json

## Turn on Static Website Hostiing
aws s3api put-bucket-website --bucket cors-new-example2 --website-configuration file://website.json

## Upload our javascript file
aws s3 cp hello.js s3://cors-new-example2

## Apply a CORS policy
