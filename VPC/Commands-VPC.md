### Comandos para serem executados antes de deletar uma VPC
```sh
aws ec2 delete-security-group --group-id 123
aws ec2 delete-network-acl --network-acl-id 123
aws ec2 delete-subnet --subnet-id 123
aws ec2 delete-route-table --route-table-id 123
aws ec2 detach-internet-gateway --internet-gateway-id 123 --vpc-id 123
aws ec2 delete-internet-gateway --internet-gateway-id 123
aws ec2 delete-egress-only-internet-gateway --egress-only-internet-gateway-id 123
aws ec2 delete-vpc --vpc-id 123
aws ec2 describe-instances \
--filters "Name=instance-state-name,Values=running" \   
--query "Reservations[*].Instances[*].[InstanceId,State.Name,PublicIpAddress,PrivateIpAddress]" \
--output table
```