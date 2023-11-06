# Instruções de Instalação para a Aplicação Rails

Este é um guia simples para configurar e iniciar uma aplicação Rails.

## Pré-requisitos

Antes de começar, você precisará ter instalado em seu sistema:

- Ruby (versão 3.1.2)
- Bundler (gerenciador de dependências do Ruby)
- SQLite3 (ou o banco de dados de sua escolha)

## Instalação

1. Clone o repositório:

```bash
git clone git@github.com:joaovareiro/racha-cafe-server.git
cd racha-cafe-server
```

2. Instale as dependências usando o Bundler:

```bash
bundle install
```

## Configuração do Banco de Dados

1. Crie o banco de dados e execute as migrações:

```bash
rails db:create
rails db:migrate
```

## Executando o Servidor

1. Inicie o servidor Rails:

```bash
rails server
```

A aplicação estará acessível em `http://localhost:3000`.

## Executando os testes

1. Inicie o Rspec
```bash
bundle exec rspec
```


