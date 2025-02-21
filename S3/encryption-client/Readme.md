## Create bucket 
```sh
aws s3 mb s3://encrypt-client-1984
```

## Create file to upload
```sh
echo "Teste criptografia lado cliente" > client.txt
```
## Cleanup
```sh
aws s3 rm s3://encrypt-client-1984/client.txt
aws s3 rb s3://encrypt-client-1984
```