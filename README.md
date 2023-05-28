# Projeto de Pset SI1N-UVV

* Aluno: William Rodrigues Andrade
* Matrícula 202205344 
* Professor: Abrantes, Turma SI1N
* Monitor(a): Suellen Miranda

> Essa atividade avaliativa foi realizado para a matéria de Design e Desenvolvimento de Banco de Dados na Universidade de Vila Velha

## O que é o Pset?
 O PSET é uma Atividade avaliativa ministrada pelo professor de banco de dados Professor Abrantes, o objetivo do aluno proposto a fazer essa atividade avaliativa é um conjunto de exercícios quais incluem: criar e manter um banco de dados de acordo com as instruções de seu professor, atividades discursivas sobre a matéria e criação lógica do banco de dados.O aluno deverá que buscar em documentações,fórums e matérias passadas em sala de aula procurar por respostas para cada  objetivo passado na atividade avaliativa
 
## Introdução
 Neste PSET o objetivo passado foi implementar um banco de dados de nome 'uvv' juntamente com o esquema chamado 'lojas' no **PostgreSQL**, sendo usado o **SQL Power Architect** para criar o banco  de dados lógico. Para assim gerar o script sql e prosseguir no trabalho. 

 Em Seguida com **Emacs** foi usado para a criação do usuário, criação do esquema, configurar o Search Path , utilizar o comando drop para garantir que não cause erros no sistema e fazer a conexão do usuário com o Banco de Dados de forma a não pedir senha. 

 Por fim foi estudado sobre o **Git/GitHub** para arquivar o trabalho para ser avaliado, enviando todos os arquivos criados no trabalho como: pdf, banco de dados lógico em formato .architect e o código-fonte do Banco de Dados.

## Banco de Dados Lógico
 A partir do **SQL Power Architect** criei todas as tabelas e seus atributos incluindo comentários, criando chaves primárias, cardinalidades, relacionamentos, chaves estrangeiras e chaves compostas. Enfim terminado o Banco de Dados criei um script SQL, salvei o [projeto em .architect](https://github.com/oWilliamRodrigues/uvv-bd1-si1n/blob/main/si1n_202205344_postgresql.architect) e um PDF do [Banco de Dados Lógico](https://github.com/oWilliamRodrigues/uvv-bd1-si1n/blob/main/si1n_202205344_postgresql.pdf) no qual estão salvo nesse GitHub.

## Banco de Dados no Postgres
 Após terminar o diagrama "lojas" no **SQL Power Arquitech** gerei o script .sql com 80% do código pronto, então, nessa parte foi criado as verificações estabelecidas no PDF, criado o **Usuário** com permissões de **CREATEDB**, **CREATEROLE** e **Senha Criptografada**. Por segurança, utilizei o comando **Drop** para apagar o banco de dados, esquema e usuário antes do código ser lido para não ter erro de duplicados. Configurei o **Search Path** do usuário para o banco de dados. Adicionei comentários para cada comando explicando sua função. Com o  [Banco de Dados](https://github.com/oWilliamRodrigues/uvv_bd1_si1n/blob/main/pset1/si1n_202205344_postgresql.sql) pronto foi enviado para o GitHub.
