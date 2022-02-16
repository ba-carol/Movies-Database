--Questão 2:
create schema filmes;

create table filmes.filmes (
	id int PRIMARY KEY,
	nome text,
	ano int,
	genero text
);

create table filmes.artistas (
	id int PRIMARY KEY,
	ator_principal boolean,
	id_filme int,
	CONSTRAINT fk_filmes FOREIGN KEY(id_filme)
		REFERENCES filmes.filmes(id)
); 

create table filmes.atores (
	id int PRIMARY KEY,
	nome text,
	nasc int
);	

--Para colocar o id_atores em filmes.artistas:
alter table filmes.artistas add id_atores int;
alter table filmes.artistas
	add CONSTRAINT fk_atores FOREIGN KEY(id_atores)
	REFERENCES filmes.atores(id);

select * from filmes.artistas
select * from filmes.filmes
select * from filmes.atores

--Questão 3:
insert into filmes.filmes (id, nome, ano, genero) values (1,'O Contratempo',2016,'Policial/Suspense');
insert into filmes.filmes (id, nome, ano, genero) values (2,'O Senhor dos Anéis 1',2001,'Fantasia/Aventura');
insert into filmes.filmes (id, nome, ano, genero) values (3,'O Senhor dos Anéis 2',2002,'Fantasia/Aventura');
insert into filmes.filmes (id, nome, ano, genero) values (4,'O Senhor dos Anéis 3',2004,'Fantasia/Aventura');
insert into filmes.filmes (id, nome, ano, genero) values (5,'Looper - Assassinos do Futuro',2012,'Ficção Científica/Ação');
insert into filmes.filmes (id, nome, ano, genero) values (6,'Um Lugar Silencioso - Parte I',2018,'Suspense/Terror');

insert into filmes.atores (id, nome, nasc) values (1,'Mario Casas',1986);
insert into filmes.atores (id, nome, nasc) values (2,'Elijah Wood',1981);
insert into filmes.atores (id, nome, nasc) values (3,'Ian McKellen',1939);
insert into filmes.atores (id, nome, nasc) values (4,'Cate Blanchett',1969);
insert into filmes.atores (id, nome, nasc) values (5,'Bruce Willis',1955);
insert into filmes.atores (id, nome, nasc) values (6,'Emily Blunt',1983);
insert into filmes.atores (id, nome, nasc) values (7,'Joseph Gordon-Levitt',1981);
insert into filmes.atores (id, nome, nasc) values (8,'Millicent Simmonds',2003);

insert into filmes.artistas (id, id_atores, id_filme, ator_principal) values (1,1,1,true);
insert into filmes.artistas (id, id_atores, id_filme, ator_principal) values (2,2,2,true);
insert into filmes.artistas (id, id_atores, id_filme, ator_principal) values (3,3,4,false);
insert into filmes.artistas (id, id_atores, id_filme, ator_principal) values (4,4,3,false);
insert into filmes.artistas (id, id_atores, id_filme, ator_principal) values (5,5,5,true);
insert into filmes.artistas (id, id_atores, id_filme, ator_principal) values (6,7,5,true);
insert into filmes.artistas (id, id_atores, id_filme, ator_principal) values (7,6,5,false);
insert into filmes.artistas (id, id_atores, id_filme, ator_principal) values (8,8,6,false);
insert into filmes.artistas (id, id_atores, id_filme, ator_principal) values (9,6,6,true);

--Questão 4, letra a:
select a.nome, count(*) 
from filmes.artistas art
join filmes.atores a
on(a.id = art.id_atores)
group by 1
order by 2 desc
limit 1

--Questão 4, letra b:
select * from filmes.filmes
order by ano asc limit 1

--Questão 4, letra c:
select avg(nasc)::numeric(10,2) from filmes.atores
