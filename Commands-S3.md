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

Referencia: https://docs.aws.amazon.com/cli/latest/reference/s3/
