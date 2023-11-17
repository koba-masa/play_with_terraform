# README

## コマンド

## INIT

```sh
terraform init -reconfigure -backend-config=backend/production.tfbackend
```

### 環境変数の設定

```sh
export TF_VAR_subnet_id={subnet.id}
export TF_VAR_security_groups={security_group.id,security_group.id}
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

※削除時にtmp配下のファイルも削除されるので、必要あれば退避すること
