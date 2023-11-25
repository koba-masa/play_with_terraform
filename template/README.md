# テンプレート

## コマンド

### INIT

```sh
terraform init -reconfigure -backend-config=backend/production.tfbackend
```

### PLAN

```sh
terraform plan -var-file environments/production.tfvars
```

### APPLY

```sh
terraform apply -var-file environments/production.tfvars
```

### DESTROY

```sh
terraform destroy -var-file environments/production.tfvars
```
