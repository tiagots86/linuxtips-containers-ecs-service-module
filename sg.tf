resource "aws_security_group" "main" {
  name   = format("%s-%s", var.cluster_name, var.service_name)
  vpc_id = var.vpc_id
  ingress {
    from_port = var.service_port
    to_port   = var.service_port
    protocol  = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  egress {
    #libera todas as portas de saída:
    from_port = 0
    to_port   = 0
    #todos os protocolos
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

}