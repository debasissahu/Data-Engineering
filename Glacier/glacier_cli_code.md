# AWS CLI command for Glacier service

Basic Command:
aws --version
where aws


Create Vault:

aws glacier create-vault --vault-name my-vault --account-id -

Delete Vault:
aws glacier delete-vault --vault-name my-vault --account-id -
