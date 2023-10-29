# README

## コマンド

## INIT

```sh
terraform init -reconfigure -backend-config=backend/production.tfbackend
```

### APPLY

```sh
terraform apply -var-file environments/production.tfvars
```

### PLAN

```sh
terraform plan -var-file environments/production.tfvars
```
