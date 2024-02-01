-- EXERCÍCIO 2:
-- 2) Escreva uma consulta SQL para retornar dados únicos conforme tabela abaixo.
-- Caso o aluno tenha mais de dois responsáveis, traga apenas os dois primeiros
-- responsáveis encontrados na tabela.

-- Povoando o banco de dados com Alunos, Responsáveis e Parentescos para melhor elucidar o problema
INSERT INTO Aluno(Nome) VALUES ('Larissa'), ('Tiago'), ('Henrique'), ('Ana');

INSERT INTO Responsavel(Nome) VALUES ('Simone'), ('Adriana'), ('Mauro'), ('Marlene'), ('Sandra'), ('Marlise');

INSERT INTO Parentesco(IdAluno, IdResponsavel, Parentesco) VALUES (2, 3, 'Mãe'), (3, 4, 'Mãe'), (3, 5, 'Pai'), (3, 6, 'Tia'), (4, 7, 'Mãe'), (5, 8, 'Mãe');

-- Seleciona as colunas desejadas das suas respectivas tabelas utilizando aliases para melhorar a leitura do código
SELECT A.Nome AS Aluno, R1.Nome AS Responsavel1, P1.Parentesco AS Parentesco1, R2.Nome AS Responsavel2, P2.Parentesco AS Parentesco2 FROM Aluno A 
-- Determina a ligação entre a tabela Aluno e a tabela Parentesco quando o ID do aluno na tabela Aluno for igual ao ID do aluno na tabela Parentesco
JOIN Parentesco P1 ON A.Id = P1.IdAluno
-- Determina a ligação entre a tabela Parentesco e a tabela Responsavel quando o ID do responsável na tabela Responsavel for igual ao ID do responsável na tabela Parentesco
JOIN Responsavel R1 ON P1.IdResponsavel = R1.Id
-- Determina uma ligação à esquerda (LEFT JOIN) entre a tabela Aluno e a tabela Parentesco quando o ID do aluno na tabela Aluno for igual ao ID do aluno na tabela Parentesco e o ID do responsável na tabela Parentesco seja diferente do ID do responsável encontrado na ligação anterior (P1)
LEFT JOIN Parentesco P2 ON A.Id = P2.IdAluno AND P2.IdResponsavel <> P1.IdResponsavel
-- Determina uma ligação à esquerda (LEFT JOIN) entre a tabela Parentesco e a tabela Responsavel quando o ID do responsável na tabela Responsavel for igual ao ID do responsável na tabela Parentesco
LEFT JOIN Responsavel R2 ON P2.IdResponsavel = R2.Id
-- Condição utilizando NOT EXISTS para garantir que não existam outros responsáveis entre o primeiro e o segundo responsável.
WHERE
  NOT EXISTS (
    SELECT 1
    FROM Parentesco P3
    WHERE A.Id = P3.IdAluno
      AND P3.IdResponsavel <> P1.IdResponsavel
      AND P3.IdResponsavel < P2.IdResponsavel
  )
-- Agrupa os resultados pelo ID do aluno, garantindo que cada aluno apareça apenas uma vez no resultado.
GROUP BY A.Id;
