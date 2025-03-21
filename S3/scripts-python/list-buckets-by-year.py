import boto3

s3 = boto3.client("s3")
buckets = s3.list_buckets()["Buckets"]

for bucket in buckets:
    year = bucket["CreationDate"].year
    print(f"{year}: {bucket['Name']}")
