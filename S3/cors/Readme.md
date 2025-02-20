## Create a bucket
```sh
aws s3 mb s3://cors-fun-ab-8490lf
aws s3 mb s3://cors-fun-ab-8491lf
```

## Create a block public access
```sh
aws s3api put-public-access-block \
    --bucket cors-fun-ab-8490lf \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

```sh
aws s3api put-public-access-block \
    --bucket cors-fun-ab-8491lf \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create policy
```sh
aws s3api put-bucket-policy --bucket cors-fun-ab-8490lf --policy file://bucket-policy.json
aws s3api put-bucket-policy --bucket cors-fun-ab-8491lf --policy file://bucket8491-policy.json
```
## Turn on static website hosting
```sh
aws s3api put-bucket-website --bucket cors-fun-ab-8490lf --website-configuration file://website.json
```
## Upload our index.html file and include a resource thar would be cross-origin
```sh
aws s3 cp index.html s3://cors-fun-ab-8490lf
```
## Get the website endpoint for s3
```sh
#http://bucket_name.s3-website-us-east-1.amazonaws.com/
http://cors-fun-ab-8490lf.s3-website-us-east-1.amazonaws.com/
```
## Apply a cors policy
```sh
```