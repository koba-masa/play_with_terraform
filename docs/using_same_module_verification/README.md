# モジュールを再利用する

## 概要

- 本番環境やステージング環境という区分ではなく、ステージング環境の中に同じようなリソースを作成する方法を検証する
  - 例：ステージング環境にブランチごとの検証環境を構築する

### 前提条件

- `workspace`を利用し、同一モジュールにて本番環境とステージング環境を切り替える

## 検証

- [tfvarsファイルを複数用意する](/docs/using_same_module_verification/using_another_tfvars.md)
- [tfstateファイルを切り替える](/docs/using_same_module_verification/using_another_tfstate_file.md)

## おまけ

### stateファイルが作成されるタイミング

```sh
% terraform init --reconfigure
% aws s3 ls s3://play-with-terraform | grep using_same_module_verification
% aws s3 ls s3://play-with-terraform/env:/prd/ | grep using_same_module_verification
% terraform workspace new prd
% aws s3 ls s3://play-with-terraform | grep using_same_module_verification
% aws s3 ls s3://play-with-terraform/env:/prd/ | grep using_same_module_verification
2024-01-08 21:42:14        180 using_same_module_verification.tfstate
% terraform apply -var-file environments/prd.tfvars
% aws s3 ls s3://play-with-terraform/env:/prd/ | grep using_same_module_verification
2024-01-08 21:43:35       1423 using_same_module_verification.tfstate
```

```sh
% terraform init -reconfigure -backend-config="key=using_same_module_verification/v2.tfstate"
% aws s3 ls s3://play-with-terraform/env:/prd/ | grep using_same_module_verification
2024-01-08 21:43:35       1423 using_same_module_verification.tfstate
% terraform workspace new prd
% aws s3 ls s3://play-with-terraform/env:/prd/ | grep using_same_module_verification
                           PRE using_same_module_verification/
2024-01-08 21:43:35       1423 using_same_module_verification.tfstate
% aws s3 ls s3://play-with-terraform/env:/prd/using_same_module_verification/
2024-01-08 21:46:44        180 v2.tfstate
% terraform apply -var-file environments/prd/v2.tfvars
% aws s3 ls s3://play-with-terraform/env:/prd/using_same_module_verification/
2024-01-08 21:50:06       1436 v2.tfstate
```
