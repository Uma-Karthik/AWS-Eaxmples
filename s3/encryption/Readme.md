## create a Bucket

aws s3 mb s3://encryption-example-uk

## Create a file

echo 'Hello World' > hello.txt
aws s3 cp hello.txt s3://encryption-example-uk

## Put Object with encryption of KMS 
aws s3api put-object \
--bucket encryption-example-uk \
--key hello.txt \
--body hello.txt \
--sever-side-encryption aws:kms