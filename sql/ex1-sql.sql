-- EXERCÍCIO 1:
-- 1) Escreva comandos SQL para inserir os dados abaixo conforme o diagrama apresentado.
-- a) Pablo é Pai de Lucas
-- b) Brenda é Mãe de Lucas

-- Inserção do aluno e dos responsáveis
INSERT INTO Aluno(Nome) VALUES ('Lucas');
INSERT INTO Responsavel(Nome) VALUES ('Pablo'), ('Brenda');

-- Consulta para confirmar a inserção e obter os ids 
SELECT * FROM Aluno;
SELECT * FROM Responsavel;

-- Inserção do parentesco relacionando os ids do aluno e dos responsáveis
INSERT INTO Parentesco(IdAluno, IdResponsavel, Parentesco) VALUES (1, 1, 'Pai'), (1, 2, 'Mãe');

-- Consulta para confirmar a inserção
SELECT * FROM Parentesco;
