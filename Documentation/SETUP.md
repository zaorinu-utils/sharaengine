# Setup de desenvolvimento

Para desenvolver localmente e executar os checks, instale o toolchain Rust (via `rustup`) e os componentes necessários:

1. Instalar Rust (rustup):

   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

2. Usar o `rust-toolchain.toml` do repositório para garantir o mesmo canal:

   rustup show

3. Instalar componentes necessários:

   rustup component add rustfmt clippy

4. Ferramentas JS (documentação e lint de arquivos Markdown):

   - Instalar Node.js (LTS): https://nodejs.org/
   - Instalar dependências JS do repositório (recomendado gerar e commitar `package-lock.json` para builds reprodutíveis):

     ```bash
     if [ -f package-lock.json ]; then
       npm ci
     else
       npm install
       # Opcional: adicione e commite o package-lock.json para travar versões
       # git add package-lock.json && git commit -m "chore(deps): add package-lock.json"
     fi
     ```

5. Comandos úteis:

   - Formatar (Rust): `cargo fmt --all`
   - Rodar clippy: `cargo clippy --all-targets --all-features -- -D warnings`
   - Build: `cargo build --release`
   - Testes: `cargo test`
   - Formatar docs com Prettier: `npm run format`
   - Verificar formatação: `npm run format:check`
   - Lint Markdown: `npm run lint:md`

Observação: o workflow de CI (GitHub Actions) já executa as verificações automaticamente em pushes e PRs.