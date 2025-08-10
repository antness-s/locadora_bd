# Banco de Dados - Locadora de Filmes

- **Tema**: Gerenciamento de aluguéis de filmes
- **Descrição**: Sistema para gerenciar filmes, diretores, clientes e aluguéis, normalizado até 3FN.
- **Entidades**: 
  - Diretores (id_diretor, nome_diretor)
  - Filmes (id_filme, titulo, id_diretor)
  - Clientes (id_cliente, nome_cliente)
  - Alugueis (id_aluguel, id_filme, id_cliente, data_aluguel)
- **Relacionamentos**: Diretor 1:N Filmes, Filme 1:N Alugueis, Cliente 1:N Alugueis
- **Prints das Consultas**:
  - INNER JOIN: [/assets/INNERJOIN-Query1.png](assets/INNERJOIN-Query1.png)
  - LEFT JOIN: [/assets/LEFTJOIN-Query2.png](assets/LEFTJOIN-Query2.png)
  - RIGHT JOIN: [/assets/RIGHTJOIN-Query3.png](assets/RIGHTJOIN-Query3.png)
