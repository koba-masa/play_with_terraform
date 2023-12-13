# CloudflareにDNSレコードを登録する

## コマンド

### INIT

```sh
terraform init -reconfigure
```

### WORKSPACE

```sh
terraform workspace select prd
```

### PLAN

```sh
terraform plan -var-file environments/prd.tfvars
```

### APPLY

```sh
terraform apply -var-file environments/prd.tfvars
```

### DESTROY

```sh
terraform destroy -var-file environments/prd.tfvars
```
