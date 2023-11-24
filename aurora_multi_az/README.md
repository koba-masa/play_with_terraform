# README

## コマンド

## INIT

```sh
terraform init -reconfigure -backend-config=backend/production.tfbackend
```

### 環境変数の設定

```sh
export TF_VAR_vpc_id={vpc.id}
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
