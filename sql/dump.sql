CREATE DATABASE diarioescola;

USE diarioescola;

CREATE TABLE Aluno(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30)
);

CREATE TABLE Responsavel(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30)
);

CREATE TABLE Parentesco(
	IdResponsavel INT,
    IdAluno INT,
    Parentesco VARCHAR(20),
    CONSTRAINT PK_Parentesco PRIMARY KEY (IdResponsavel, IdAluno),
    FOREIGN KEY (IdResponsavel) REFERENCES Responsavel(Id),
    FOREIGN KEY (IdAluno) REFERENCES Aluno(Id)
);
