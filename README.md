# サンプル Dotfiles リポジトリ

このディレクトリは、プロジェクトリポジトリに設定を一切含めずに、VS Code Dev Containers（または `devcontainer` CLI）と組み合わせて使いやすい最小構成の dotfiles セットアップを示しています。

## 構成

- `install.sh` – Dev Containers がリポジトリを `~/.dotfiles` にクローンした後、自動的に呼び出されます。Git 設定フラグメントとカスタム Git サブコマンドをホームディレクトリにインストールします。
- `git/git-aliases.gitconfig` – `~/.gitconfig` から読み込まれる別の Git 設定フラグメントです。プロジェクトリポジトリを汚さずに、Git に関する調整をここにまとめておけます。
- `bin/git-hello` – Git のカスタムコマンドの例です。`PATH` 上にある `git-*` という名前の実行ファイルは、`git *` として呼び出せるようになります。

## 使い方

1. このディレクトリをプライベートな dotfiles リポジトリにプッシュします。リポジトリのルートには `install.sh` を置いてください。
2. VS Code を開き、**Settings** で `Dev › Containers: Dotfiles Repository` を Git の URL に設定します（または `devcontainer` CLI で `--dotfiles-repository` を指定）。
3. Dev Container を再度開きます。dotfiles リポジトリが `~/.dotfiles` にクローンされ、`install.sh` が自動的に実行されます。
4. コンテナ内で `git hello` を実行し、カスタムコマンドが利用可能になっていることを確認します。

このリポジトリは、`bin/` にスクリプトを追加したり、シェル設定やエディタ設定を加えることで拡張できます。同期されるのは dotfiles リポジトリ内のファイルだけで、プロジェクトリポジトリは手つかずのまま保たれます。
