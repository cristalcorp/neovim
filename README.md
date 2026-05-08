# LSP
Install the following LSP on your system so they can be called by vim

## NPM
```bash
mkdir ~/.npm-global
npm config set prefix ~/.npm-global
echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```
## Python
```bash
# LSP
npm install -g basedpyright
# Linter
npm install -g ruff
```
## Rust
```bash
cargo install rustanalyzer
```
## HTML
```bash
npm install -g vscode-langservers-extracted
```
## Markdown
```bash
yay -S marksman
```
