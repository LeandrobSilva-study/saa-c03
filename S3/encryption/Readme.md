## Create bucket 
```sh
aws s3 mb s3://encrypt-lb-1984
```
## Create a file 
```sh
echo "Apenas um teste de criptografia" > teste.txt
aws s3 cp teste.txt s3://encrypt-lb-1984
```

## Put object with encryption of SSE-KMS
## list keys createds 
```sh
aws kms list-keys 

aws s3api put-object \
--bucket encrypt-lb-1984 \
--key teste.txt \
--body teste.txt \
--server-side-encryption "aws:kms" \
--ssekms-key-id "69bfea59-deb6-400a-b58c-d724a38bbe"
```

## Put Object with SSE-C
```sh
export BASE64_ENCODED_KEY=$(openssl rand -base64 32)
echo $BASE64_ENCODED_KEY

export MD5_value=$(echo $BASE64_ENCODED_KEY | md5sum | awk '{print $1}' | base64 -w0)

openssl rand -out ssec.key 32

aws s3api put-object \
--bucket encrypt-lb-1984 \
--key teste2.txt \
--body teste2.txt \
--sse-customer-algorithm AES256 \
--sse-customer-key $BASE64_ENCODED_KEY \
--sse-customer-key-md5 $MD5_value


aws s3 cp teste.txt s3://encrypt-lb-1984/teste2.txt --sse-c AES256 --sse-c-key file://ssec.key
```