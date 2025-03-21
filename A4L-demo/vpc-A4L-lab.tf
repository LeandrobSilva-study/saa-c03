provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "vpc-A4L-lab" {
  cidr_block                       = "10.16.0.0/16"
  assign_generated_ipv6_cidr_block = true
  enable_dns_hostnames             = true
  tags = {
    "Name" = "vpc-A4L-lab"
  }
}

resource "aws_route_table" "rt-A4L-lab" {
  vpc_id = aws_vpc.vpc-A4L-lab.id
  tags = {
    "Name" = "rt-A4L-lab"
  }
}

resource "aws_main_route_table_association" "rt-A4L-lab-assoc" {
  vpc_id         = aws_vpc.vpc-A4L-lab.id
  route_table_id = aws_route_table.rt-A4L-lab.id
}

resource "aws_internet_gateway" "IGW-A4L-lab" {
  vpc_id = aws_vpc.vpc-A4L-lab.id
  tags = {
    "Name" = "IGW-A4L-lab"
  }
}

resource "aws_subnet" "sn-lab-reserved-A" {
  vpc_id            = aws_vpc.vpc-A4L-lab.id
  cidr_block        = "10.16.0.0/20"
  ipv6_cidr_block   = cidrsubnet(aws_vpc.vpc-A4L-lab.ipv6_cidr_block, 8, 0)
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "sn-lab-reserved-A"
  }
}

resource "aws_subnet" "sn-lab-reserved-B" {
  vpc_id            = aws_vpc.vpc-A4L-lab.id
  cidr_block        = "10.16.64.0/20"
  ipv6_cidr_block   = cidrsubnet(aws_vpc.vpc-A4L-lab.ipv6_cidr_block, 8, 4)
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "sn-lab-reserved-B"
  }
}

resource "aws_subnet" "sn-lab-reserved-C" {
  vpc_id            = aws_vpc.vpc-A4L-lab.id
  cidr_block        = "10.16.128.0/20"
  ipv6_cidr_block   = cidrsubnet(aws_vpc.vpc-A4L-lab.ipv6_cidr_block, 8, 8)
  availability_zone = "us-east-1c"
  tags = {
    "Name" = "sn-lab-reserved-C"
  }
}

resource "aws_subnet" "sn-lab-db-A" {
  vpc_id            = aws_vpc.vpc-A4L-lab.id
  cidr_block        = "10.16.16.0/20"
  ipv6_cidr_block   = cidrsubnet(aws_vpc.vpc-A4L-lab.ipv6_cidr_block, 8, 1)
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "sn-lab-db-A"
  }
}

resource "aws_subnet" "sn-lab-db-B" {
  vpc_id            = aws_vpc.vpc-A4L-lab.id
  cidr_block        = "10.16.80.0/20"
  ipv6_cidr_block   = cidrsubnet(aws_vpc.vpc-A4L-lab.ipv6_cidr_block, 8, 5)
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "sn-lab-db-B"
  }
}

resource "aws_subnet" "sn-lab-db-C" {
  vpc_id            = aws_vpc.vpc-A4L-lab.id
  cidr_block        = "10.16.144.0/20"
  ipv6_cidr_block   = cidrsubnet(aws_vpc.vpc-A4L-lab.ipv6_cidr_block, 8, 9)
  availability_zone = "us-east-1c"
  tags = {
    "Name" = "sn-lab-db-C"
  }
}

resource "aws_subnet" "sn-lab-app-A" {
  vpc_id            = aws_vpc.vpc-A4L-lab.id
  cidr_block        = "10.16.32.0/20"
  ipv6_cidr_block   = cidrsubnet(aws_vpc.vpc-A4L-lab.ipv6_cidr_block, 8, 2)
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "sn-lab-app-A"
  }
}

resource "aws_subnet" "sn-lab-app-B" {
  vpc_id            = aws_vpc.vpc-A4L-lab.id
  cidr_block        = "10.16.96.0/20"
  ipv6_cidr_block   = cidrsubnet(aws_vpc.vpc-A4L-lab.ipv6_cidr_block, 8, 6)
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "sn-lab-app-B"
  }
}

resource "aws_subnet" "sn-lab-app-C" {
  vpc_id            = aws_vpc.vpc-A4L-lab.id
  cidr_block        = "10.16.160.0/20"
  ipv6_cidr_block   = cidrsubnet(aws_vpc.vpc-A4L-lab.ipv6_cidr_block, 8, 10)
  availability_zone = "us-east-1c"
  tags = {
    "Name" = "sn-lab-app-C"
  }
}

resource "aws_subnet" "sn-lab-pub-A" {
  vpc_id                  = aws_vpc.vpc-A4L-lab.id
  cidr_block              = "10.16.48.0/20"
  ipv6_cidr_block         = cidrsubnet(aws_vpc.vpc-A4L-lab.ipv6_cidr_block, 8, 3)
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = {
    "Name" = "sn-lab-pub-A"
  }
}

resource "aws_subnet" "sn-lab-pub-B" {
  vpc_id                  = aws_vpc.vpc-A4L-lab.id
  cidr_block              = "10.16.112.0/20"
  ipv6_cidr_block         = cidrsubnet(aws_vpc.vpc-A4L-lab.ipv6_cidr_block, 8, 7)
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"
  tags = {
    "Name" = "sn-lab-pub-B"
  }
}

resource "aws_subnet" "sn-lab-pub-C" {
  vpc_id                  = aws_vpc.vpc-A4L-lab.id
  cidr_block              = "10.16.176.0/20"
  ipv6_cidr_block         = cidrsubnet(aws_vpc.vpc-A4L-lab.ipv6_cidr_block, 8, 11)
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1c"
  tags = {
    "Name" = "sn-lab-pub-C"
  }
}

resource "aws_route" "internet_route_ipv4" {
  route_table_id         = aws_route_table.rt-A4L-lab.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.IGW-A4L-lab.id
}

resource "aws_route" "internet_route_ipv6" {
  route_table_id              = aws_route_table.rt-A4L-lab.id
  destination_ipv6_cidr_block = "::/0"
  gateway_id                  = aws_internet_gateway.IGW-A4L-lab.id
}

/*resource "aws_route_table_association" "assoc_sn-lab-reserved-a" {
  subnet_id      = aws_subnet.sn-lab-reserved-A.id
  route_table_id = aws_route_table.rt-A4L-lab.id
}

resource "aws_route_table_association" "assoc_sn-lab-reserved-b" {
  subnet_id      = aws_subnet.sn-lab-reserved-B.id
  route_table_id = aws_route_table.rt-A4L-lab.id
}

resource "aws_route_table_association" "assoc_sn-lab-reserved-c" {
  subnet_id      = aws_subnet.sn-lab-reserved-C.id
  route_table_id = aws_route_table.rt-A4L-lab.id
}

resource "aws_route_table_association" "assoc_sn-lab-db-a" {
  subnet_id      = aws_subnet.sn-lab-db-A.id
  route_table_id = aws_route_table.rt-A4L-lab.id
}
resource "aws_route_table_association" "assoc_sn-lab-db-b" {
  subnet_id      = aws_subnet.sn-lab-db-B.id
  route_table_id = aws_route_table.rt-A4L-lab.id
}
resource "aws_route_table_association" "assoc_sn-lab-db-c" {
  subnet_id      = aws_subnet.sn-lab-db-C.id
  route_table_id = aws_route_table.rt-A4L-lab.id
}
resource "aws_route_table_association" "assoc_sn-lab-app-a" {
  subnet_id      = aws_subnet.sn-lab-app-A.id
  route_table_id = aws_route_table.rt-A4L-lab.id
}
resource "aws_route_table_association" "assoc_sn-lab-app-b" {
  subnet_id      = aws_subnet.sn-lab-app-B.id
  route_table_id = aws_route_table.rt-A4L-lab.id
}
resource "aws_route_table_association" "assoc_sn-lab-app-c" {
  subnet_id      = aws_subnet.sn-lab-app-C.id
  route_table_id = aws_route_table.rt-A4L-lab.id
}*/

resource "aws_route_table_association" "assoc_sn-lab-pub-a" {
  subnet_id      = aws_subnet.sn-lab-pub-A.id
  route_table_id = aws_route_table.rt-A4L-lab.id
}
resource "aws_route_table_association" "assoc_sn-lab-pub-b" {
  subnet_id      = aws_subnet.sn-lab-pub-B.id
  route_table_id = aws_route_table.rt-A4L-lab.id
}
resource "aws_route_table_association" "assoc_sn-lab-pub-c" {
  subnet_id      = aws_subnet.sn-lab-pub-C.id
  route_table_id = aws_route_table.rt-A4L-lab.id
}

## Security Group A4LVPC-WordpressInstanceProfile

resource "aws_security_group" "A4LVPC-WordpressInstanceProfile" {
  name        = "allow_connect_http"
  description = "Control access to Wordpress Instance(s)"
  vpc_id      = aws_vpc.vpc-A4L-lab.id

  tags = {
    "Name" = "A4LVPC-WordpressInstanceProfile"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg-allow_http_ipv4" {
  security_group_id = aws_security_group.A4LVPC-WordpressInstanceProfile.id
  #cidr_ipv4         = aws_vpc.vpc-A4L-lab.cidr_block
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "sg-allow_http_ipv6" {
  security_group_id = aws_security_group.A4LVPC-WordpressInstanceProfile.id
  #cidr_ipv6         = aws_vpc.vpc-A4L-lab.ipv6_cidr_block
  cidr_ipv6   = "::/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.A4LVPC-WordpressInstanceProfile.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.A4LVPC-WordpressInstanceProfile.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}

## Security Group A4LVPC-SGDatabase

resource "aws_security_group" "A4LVPC-SGDatabase" {
  name        = "allow_connect_db"
  description = "Control access to database MySQL"
  vpc_id      = aws_vpc.vpc-A4L-lab.id
  tags = {
    "Name" = "A4LVPC-SGDatabase"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg-allow_rds_ipv4" {
  security_group_id = aws_security_group.A4LVPC-SGDatabase.id
  from_port         = 3306
  to_port           = 3306
  ip_protocol       = "tcp"
  referenced_security_group_id = aws_security_group.A4LVPC-WordpressInstanceProfile.id
}

/*resource "aws_vpc_security_group_ingress_rule" "sg-allow_rds_ipv6" {
  security_group_id = aws_security_group.A4LVPC-SGDatabase.id
  from_port         = 3306
  to_port           = 3306
  ip_protocol       = "tcp"
  referenced_security_group_id = aws_security_group.A4LVPC-WordpressInstanceProfile.id
}*/

resource "aws_vpc_security_group_egress_rule" "sg-allow_all_traffic_rds_ipv4" {
  security_group_id = aws_security_group.A4LVPC-SGDatabase.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "sg-allow_all_traffic_rds_ipv6" {
  security_group_id = aws_security_group.A4LVPC-SGDatabase.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}

## SecurityGroup A4L-LoadBalancer

resource "aws_security_group" "A4LVPC-LoadBalancer" {
  name = "allow-connect-lb"
  description = "Control access to connet Load Balancer"
  vpc_id = aws_vpc.vpc-A4L-lab.id
  tags = {
    "Name" = "A4LVPC-LoadBalancer"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg-allow-access-lb-ipv4" {
  security_group_id = aws_security_group.A4LVPC-LoadBalancer.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 80
  to_port = 80
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "sg-allow-access-lb-ipv6" {
  security_group_id = aws_security_group.A4LVPC-LoadBalancer.id
  cidr_ipv6 = "::/0"
  from_port = 80
  to_port = 80
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "sg-allow-access-lb-ipv4" {
  security_group_id = aws_security_group.A4LVPC-LoadBalancer.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_vpc_security_group_egress_rule" "sg-allow-access-lb-ipv6" {
  security_group_id = aws_security_group.A4LVPC-LoadBalancer.id
  cidr_ipv6 = "::/0"
  ip_protocol = "-1"
}

## Security Group A4LVPC-SGEFS

resource "aws_security_group" "A4LVPC-SGEFS" {
  name        = "allow_connect_efs"
  description = "Control access to EFS Multi-Point"
  vpc_id      = aws_vpc.vpc-A4L-lab.id
  tags = {
    "Name" = "A4LVPC-SGEFS"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg-allow_efs_ipv4" {
  security_group_id = aws_security_group.A4LVPC-SGEFS.id
  from_port         = 2049
  to_port           = 2049
  ip_protocol       = "tcp"
  referenced_security_group_id = aws_security_group.A4LVPC-WordpressInstanceProfile.id
}

/*resource "aws_vpc_security_group_ingress_rule" "sg-allow_efs_ipv6" {
  security_group_id = aws_security_group.A4LVPC-SGEFS.id
  from_port         = 2049
  to_port           = 2049
  ip_protocol       = "tcp"
  referenced_security_group_id = aws_security_group.A4LVPC-WordpressInstanceProfile.id
}*/

resource "aws_vpc_security_group_egress_rule" "sg-allow_all_traffic_efs_ipv4" {
  security_group_id = aws_security_group.A4LVPC-SGEFS.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "sg-allow_all_traffic_efs_ipv6" {
  security_group_id = aws_security_group.A4LVPC-SGEFS.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}
