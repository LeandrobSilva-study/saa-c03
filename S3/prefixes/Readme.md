## Create bucket 
```sh
aws s3 mb s3://prefixes-fun-ab-1984
```
## Create folder
```sh
aws s3api put-object --bucket="prefixes-fun-ab-1984" --key "teste/"
```

## Create many folder
```sh
aws s3api put-object --bucket="prefixes-fun-ab-1984" --key "teste/"
```
