Import-Module AWS.Tools.S3

$region = "us-east-1"

$bucketName = Read-Host -Prompt 'Enter the S3 bucket name'

Write-Host "AWS Region: $region"
Write-Host "S3 Bucket: $bucketName"

function BucketExits {
    $bucket = Get-S3Bucket -BucketName $bucketName -ErrorAction SilentlyContinue
    return $null -ne $bucket
}
if (-not (BucketExits)){
    Write-Host "Bucket does not exits..."
    New-S3Bucket -BucketName $bucketName -Region $region
}else {
    Write-Host "Bucket aiready exits..."
}
New-S3Bucket -BucketName $bucketName -Region $region

# Create anew file
$fileName = 'myfile.txt'
$fileContent = 'Hello world'
Set-Content -Path $fileName -Value $fileContent

Write-S3Object -BucketName $bucketName -File $fileName -Key $fileName