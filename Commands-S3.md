### Criar bucket:
```sh
aws s3api create-bucket --bucket my-example-bucket-ab --region us-east-1
```
### Listar todos bucket:
```sh
aws s3api list-buckets --query "Buckets[].Name"
```
### Upload de um unico objeto:
```sh
aws s3 cp path/to/local/file.txt s3://my-example-bucket
```
### Upload de multiplos objetos:
```sh
aws s3 sync path/to/local/directory/ s3://my-example-bucket
```
### Download de um unico objeto:
```sh
aws s3 cp s3://my-example-bucket-ab/file.txt path/to/local/directory/
```
### Download de multiplos objetos:
```sh
aws s3 sync s3://my-example-bucket-ab/ path/to/local/directory/
```
### Listar objetos:
```sh
aws s3api list-objects-v2 --bucket my-bucket
```
### Apagar objetos:
```sh
aws s3 rm s3://my-example-bucket-ab/file.txt
```
### Apgar todos os objetos:
```sh
aws s3 rm s3://my-example-bucket-ab/ --recursive
```
### Deletar o bucket:
```sh
aws s3api delete-bucket --bucket my-example-bucket-ab
```
### Get object metadata:
```sh
aws s3api head-object --bucket my-example-bucket-ab --key file.txt
```
### Habilitar versionamento no Bucket
```sh
aws s3api put-bucket-versioning --bucket my-example-bucket-ab --versioning-configuration Status=Enabled
```
### consulta erros para criar bucket pelo CloudFormation
```sh
aws cloudformation describe-stack-events --stack-name cfn-simple-s3
```
### copia todos os objetos de um backet para outro (clona)
```sh
aws s3 sync s3://my-teste-bucket-saac-03 s3://bucket-temp-1984
```
### Deletar todos os arquivos de dentro da pasta e depois removê-la
```sh
aws s3 rm s3://my-bucket/my-folder/ --recursive
```

### Referencia: https://docs.aws.amazon.com/cli/latest/reference/s3/

### List objects
```sh
aws s3api list-objects-v2 --bucket my-bucket --prefix my-folder/ --query "Contents[].Key" --output text | xargs -I {} aws s3api delete-object --bucket my-bucket --key "{}"
```
### Change metadata
```sh
aws s3api copy-object \
    --bucket your-bucket-name \
    --copy-source your-bucket-name/your-object-key \
    --key your-object-key \
    --metadata-directive REPLACE \
    --metadata "x-amz-meta-newkey=newvalue"
```
## Paralelismo command sync on S3
```sh
aws configure set default.s3.max_concurrent_requests 20

aws s3 sync s3://source-files/folder1 s3://dest-files/folder2 --exclude "*" --include "*.mp4"
```
