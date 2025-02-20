## Create a new bucket

```md
aws s3 mb s3://bucket-temp-1984-02
```

## Criar o arquivo que será feito o checksum 

```md
echo "Treinamento SAA-C03" > leandro.txt
```

## Fazer o checksum do arquivo usando md5sum

md5sum leandro.txt
# 39674d336fd3479ed75141ec1ebb041f  Readme.md

## Upload do arquivo
aws s3 cp leandro.txt s3://bucket-temp-1984-02

## Consulta objeto no bucket
# rhash --crc32 --simple leandro.txt > checksum1.crc32

aws s3api head-object --bucket bucket-temp-1984-02 --key leandro.txt
