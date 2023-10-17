# play_with_terraform
Terraformで遊び尽くすリポジトリ

## 環境構築

### Terraformのインストール

1. `tfenv`をインストールする
   ```sh
   brew install tfenv
   ```
2. 指定されたバージョンのTerraformをインストールする
   ```sh
   tfenv install
   ```

### Linterのインストール
```sh
brew install tflint
```

## CI

### フォーマッターの実行

```sh
terraform fmt -recursive
```

### Linterの実行

#### チェック

```sh
tflint --recursive
```

#### 修正

```sh
tflint --recursive --fix
```
