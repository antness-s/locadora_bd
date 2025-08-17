# Banco de Dados - Locadora de Filmes

**Autor:** Gabriel Antunes Przygoda 3°D  
**Tema:** Gestão de Locadora de Filmes  

## 📄 Descrição do Problema Modelado
O sistema modelado tem como objetivo gerenciar as operações de uma locadora de filmes, abrangendo desde o cadastro de filmes e diretores até o controle de aluguéis e clientes. Ele inclui:

- **Diretores**: Cadastro de diretores com seus nomes, permitindo rastrear a autoria dos filmes.
- **Filmes**: Catálogo de filmes disponíveis, com títulos e associação aos diretores.
- **Clientes**: Registro de clientes com nomes, para monitoramento de aluguéis e histórico.
- **Alugueis**: Controle detalhado de cada aluguel, relacionando filmes, clientes e datas de locação.
O sistema possibilita consultas sobre filmes mais alugados, clientes frequentes e histórico de locações. Ele suporta a tomada de decisões, como identificar os filmes mais populares e gerenciar a disponibilidade de estoque, além de oferecer relatórios úteis por meio de views e agregações.

A modelagem garante integridade referencial entre entidades (via chaves estrangeiras), normalização até a 3ª forma normal (3FN), e suporte a análises detalhadas com consultas avançadas.

## 📌 Explicação das Entidades e Relacionamentos
1. **Diretores**  
   **Descrição**: Armazena informações dos diretores, como nome, para associar aos filmes da locadora.  
   **Relacionamentos**:  
   - Um diretor pode ter vários filmes (filmes.id_diretor).

2. **Filmes**  
   **Descrição**: Lista os filmes disponíveis na locadora, com título e referência ao diretor responsável.  
   **Relacionamentos**:  
   - Um filme pode estar associado a vários aluguéis (alugueis.id_filme).

3. **Clientes**  
   **Descrição**: Registra os clientes da locadora, com nome, para controle de aluguéis.  
   **Relacionamentos**:  
   - Um cliente pode ter vários aluguéis (alugueis.id_cliente).

4. **Alugueis**  
   **Descrição**: Registra cada locação realizada, com referência ao filme, cliente e data do aluguel.  
   **Relacionamentos**:  
   - Cada aluguel está vinculado a um filme e um cliente.

## 🖼️ DER / Modelo
O DER completo foi exportado do DBML do projeto para PNG e está disponível no repositório como `locadora_db.png`.

## 🧱 Scripts SQL
O script completo está disponível no arquivo `locadora.sql` no repositório. Ele contém:

- Criação de banco e tabelas
- Inserção de dados fictícios
- Views, consultas JOIN, subqueries e agregações

### Exemplos de Consultas:
- **1. Filmes e Diretores**  
  `SELECT F.titulo, D.nome_diretor FROM Filmes F INNER JOIN Diretores D ON F.id_diretor = D.id_diretor;`

- **2. Clientes e Datas de Aluguel**  
  `SELECT C.nome_cliente, A.data_aluguel FROM Clientes C LEFT JOIN Alugueis A ON C.id_cliente = A.id_cliente;`

- **3. Filmes Alugados com Datas**  
  `SELECT F.titulo, A.data_aluguel FROM Filmes F RIGHT JOIN Alugueis A ON F.id_filme = A.id_filme;`

- **4. Filmes de Diretores com Mais de Um Filme**  
  `SELECT titulo FROM Filmes WHERE id_diretor IN (SELECT id_diretor FROM Filmes GROUP BY id_diretor HAVING COUNT(*) > 1);`

- **5. Totais de Aluguéis por Cliente**  
  `SELECT nome_cliente, (SELECT COUNT(*) FROM Alugueis A WHERE A.id_cliente = C.id_cliente) AS total_alugueis FROM Clientes C;`

- **6. Totais de Aluguéis por Filme**  
  `SELECT F.titulo, COUNT(A.id_aluguel) AS total_alugueis FROM Filmes F LEFT JOIN Alugueis A ON F.id_filme = A.id_filme GROUP BY F.titulo;`
- **Prints das Consultas**:
  - INNER JOIN: [/assets/INNERJOIN-Query1.png](assets/INNERJOIN-Query1.png)
  - LEFT JOIN: [/assets/LEFTJOIN-Query2.png](assets/LEFTJOIN-Query2.png)
  - RIGHT JOIN: [/assets/RIGHTJOIN-Query3.png](assets/RIGHTJOIN-Query3.png)
