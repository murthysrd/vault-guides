# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "endpoints" {
  value = <<EOF

Vault Server IP (public):  ${join(", ", aws_instance.vault-server.*.public_ip)}
Vault Server IP (private): ${join(", ", aws_instance.vault-server.*.private_ip)}

For example:
   ssh -i ${var.key_name}.pem ubuntu@${aws_instance.vault-server[0].public_ip}

Vault Client IP (public):  ${aws_instance.vault-client.public_ip}
Vault Client IP (private): ${aws_instance.vault-client.private_ip}

For example:
   ssh -i ${var.key_name}.pem ubuntu@${aws_instance.vault-client.public_ip}

Vault Client IAM Role ARN: ${aws_iam_role.vault-client.arn}

EOF

}
