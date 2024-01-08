# tfvarsファイルを複数用意する

## 概要

- 複数の`tfvars`を用意して、それぞれ構築する

## 検証結果

1. ファイルの差分を確認する

    ```sh
    % diff environments/prd.tfvars environments/prd/v2.tfvars
    3a4
    > identifier  = "v2"
    ```

2. `init`を実行する

    ```sh
    % terraform init --reconfigure
    Terraform has been successfully initialized!
    ```

3. `workspace`を作成する

    ```sh
    % terraform workspace new prd
    Created and switched to workspace "prd"!
    ```

4. `environments/prd.tfvars`を利用して、構築する

    ```sh
    % terraform apply -var-file environments/prd.tfvars
    Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
    ```

5. `environments/prd/v2.tfvars`を利用して、構築する

    ```sh
    % terraform plan -var-file environments/prd/v2.tfvars
    module.user.aws_iam_user.user: Refreshing state... [id=play-with-terraform_production_state_creation_verification]

    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
      ~ update in-place

    Terraform will perform the following actions:

      # module.user.aws_iam_user.user will be updated in-place
      ~ resource "aws_iam_user" "user" {
            id            = "play-with-terraform_production_state_creation_verification"
          ~ name          = "play-with-terraform_production_state_creation_verification" -> "play-with-terraform_production_v2_state_creation_verification"
          ~ tags          = {
                "Environment" = "production"
                "Function"    = "state_creation_verification"
              ~ "Identifier"  = "" -> "v2"
                "Project"     = "play-with-terraform"
            }
          ~ tags_all      = {
              ~ "Identifier"  = "" -> "v2"
                # (3 unchanged elements hidden)
            }
            # (4 unchanged attributes hidden)
        }

    Plan: 0 to add, 1 to change, 0 to destroy.

    ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

    Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
    ```

## 結論

- 同じリソースを更新してしまうため、目的が達成できない。
