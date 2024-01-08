# 同一モジュールを再利用する

## コマンド

### backend.tfに記載されている内容で構築する

- INIT

```sh
terraform init -reconfigure
```

- WORKSPACE

```sh
terraform workspace select prd
```

- APPLY

```sh
terraform apply -var-file environments/prd.tfvars
```

- DESTROY

```sh
terraform destroy -var-file environments/prd.tfvars
```

### backend.tfに記載されている内容を上書いて構築する

- INIT

```sh
terraform init -reconfigure -backend-config="key=using_same_module_verification/v2.tfstate"
```

- WORKSPACE

```sh
terraform workspace select prd
```

- APPLY

```sh
terraform apply -var-file environments/prd/v2.tfvars
```

- DESTROY

```sh
terraform destroy -var-file environments/prd/v2.tfvars
```
