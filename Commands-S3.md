### Criar bucket:
aws s3api create-bucket --bucket my-example-bucket-ab --region us-east-1
### Listar todos bucket:
aws s3api list-buckets --query "Buckets[].Name"
### Upload de um unico objeto:
aws s3 cp path/to/local/file.txt s3://my-example-bucket
### Upload de multiplos objetos:
aws s3 sync path/to/local/directory/ s3://my-example-bucket
### Download de um unico objeto:
aws s3 cp s3://my-example-bucket-ab/file.txt path/to/local/directory/
### Download de multiplos objetos:
aws s3 sync s3://my-example-bucket-ab/ path/to/local/directory/
### Listar objetos:
aws s3api list-objects-v2 --bucket my-bucket
### Apagar objetos:
aws s3 rm s3://my-example-bucket-ab/file.txt
### Apgar todos os objetos:
aws s3 rm s3://my-example-bucket-ab/ --recursive
### Deletar o bucket:
aws s3api delete-bucket --bucket my-example-bucket-ab
### Get object metadata:
aws s3api head-object --bucket my-example-bucket-ab --key file.txt
### Habilitar versionamento no Bucket
aws s3api put-bucket-versioning --bucket my-example-bucket-ab --versioning-configuration Status=Enabled

### consulta erros para criar bucket pelo CloudFormation
aws cloudformation describe-stack-events --stack-name cfn-simple-s3

### copia todos os objetos de um backet para outro (clona)
aws s3 sync s3://my-teste-bucket-saac-03 s3://bucket-temp-1984

### Deletar todos os arquivos de dentro da pasta e depois removê-la
aws s3 rm s3://my-bucket/my-folder/ --recursive

### 
### Referencia: https://docs.aws.amazon.com/cli/latest/reference/s3/

### List objects
aws s3api list-objects-v2 --bucket my-bucket --prefix my-folder/ --query "Contents[].Key" --output text | xargs -I {} aws s3api delete-object --bucket my-bucket --key "{}"

### Change metadata
aws s3api copy-object \
    --bucket your-bucket-name \
    --copy-source your-bucket-name/your-object-key \
    --key your-object-key \
    --metadata-directive REPLACE \
    --metadata "x-amz-meta-newkey=newvalue"
    