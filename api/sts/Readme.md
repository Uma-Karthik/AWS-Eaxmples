## create a user with no permissions

aws iam create-user --user-name sts-exampleuma-user
aws iam create-access-key --user-name sts-exampleuma-user --output table

## copy the access key and secret here
aws configure

## Then edit credentials file to change away form default profile





## Create a role


We need to create a role that will access a new resource

## Use new user cendnetials and assum role

we need to create a new user with no permissions and generate out access keys