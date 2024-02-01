-- BÔNUS:
-- 1) Escreva uma consulta SQL para trazer todos os dados. Seja criativo.

-- Seleciona as colunas desejadas das suas respectivas tabelas utilizando aliases para melhorar a leitura do código
SELECT
  A.Id AS Matricula,
  A.Nome AS Aluno,
  R1.Id AS IdResponsavel1,
  R1.Nome AS Responsavel1,
  P1.Parentesco AS Parentesco1,
  R2.Id AS IdResponsavel2,
  R2.Nome AS Responsavel2,
  P2.Parentesco AS Parentesco2,
  -- Coluna para exibir a quantidade de responsaveis de cada aluno
  (SELECT COUNT(*) FROM Parentesco P3 WHERE P3.IdAluno = A.Id) AS QuantidadeResponsaveis
FROM
  Aluno A
JOIN
  Parentesco P1 ON A.Id = P1.IdAluno
JOIN
  Responsavel R1 ON P1.IdResponsavel = R1.Id
LEFT JOIN
  Parentesco P2 ON A.Id = P2.IdAluno AND P2.IdResponsavel <> P1.IdResponsavel
LEFT JOIN
  Responsavel R2 ON P2.IdResponsavel = R2.Id
  WHERE
  NOT EXISTS (
    SELECT 1
    FROM Parentesco P3
    WHERE A.Id = P3.IdAluno
      AND P3.IdResponsavel <> P1.IdResponsavel
      AND P3.IdResponsavel < P2.IdResponsavel
  )
GROUP BY A.Id;