## Craete a new bucket

aws s3api create-bucket --bucket acl-example-uk679842 --region us-east-1

## Turn of Block Publie Access for ACLs

aws s3api put-public-access-block \
--bucket acl-example-uk679842 \
--public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"

'''sh
aws s3api get-public-access-block --bucket acl-example-uk679842 
'''

## change Bucket ownership
aws s3api put-bucket-ownership-controls \
--bucket acl-example-uk679842 \
--ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"

## Change ACLs to allow  for a user in another AWS Account 
aws s3api put-bucket-acl 
--bucket amzn-s3-demo-bucket 
--grant-full-control emailaddress=user1@example.com,emailaddress=user2@example.com 
--grant-read uri=http://acs.amazonaws.com/groups/global/AllUsers

1f0889cd34796acfd8f871ea7a4578e8d334ffb5b1e93f9c81953de673e6c712