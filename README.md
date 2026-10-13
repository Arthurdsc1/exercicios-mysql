# Exercícios de MySQL — Curso de Dados (Felipe Mafra)

Repositório com os exercícios de banco de dados (MySQL) que resolvi durante o curso de dados do Felipe Mafra, na Udemy. O objetivo é praticar SQL e registrar minha evolução ao longo do curso.

> **Aviso:** este repositório contém apenas as minhas resoluções. O conteúdo do curso (aulas, slides e materiais) pertence ao instrutor e não está incluído aqui.

## Sobre o curso

- **Instrutor:** Felipe Mafra
- **Plataforma:** Udemy
- **Curso:** O curso completo de Banco de Dados e SQL, sem mistérios!

## Estrutura do repositório

```
exercicios-mysql/
├── README.md
├── 01-basico/
│   ├── schema.sql        # criação das tabelas
│   ├── dados.sql         # dados de exemplo (INSERTs)
│   └── exercicios.sql    # enunciados e minhas respostas
├── 02-joins/
└── 03-subqueries/
```

Cada pasta corresponde a um tema do curso. Dentro dela:

- `schema.sql`: cria as tabelas
- `dados.sql`: insere os dados de exemplo
- `exercicios.sql`: traz o enunciado como comentário e, logo abaixo, a query que escrevi

## Temas abordados

| Pasta | Tema | Status |
|-------|------|--------|
| 01-basico | SELECT, WHERE, ORDER BY, LIMIT | Concluído |
| 02-joins | INNER JOIN, LEFT JOIN, RIGHT JOIN | Em andamento |
| 03-subqueries | Subconsultas | A fazer |

> Ajuste a tabela conforme os temas que você já estudou.

## Como rodar

1. Instale o MySQL (testado na versão [coloque a sua versão]) e uma ferramenta como o MySQL Workbench.
2. Crie um banco de dados:
   ```sql
   CREATE DATABASE exercicios;
   USE exercicios;
   ```
3. Dentro da pasta do tema que quiser testar, execute os arquivos nesta ordem:
   1. `schema.sql`
   2. `dados.sql`
   3. `exercicios.sql`

## Tecnologias

- MySQL
- MySQL Workbench

## Autor

[Seu nome] — [link do seu LinkedIn ou GitHub, se quiser]
