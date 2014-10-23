## explorador

Portal de dados de biodiversidade do Sistema de Informação sobre a Biodiversidade Brasileira.

O explorador é um portal para a exibição dos dados e metadados dos recursos - conjuntos de dados e listas de espécies - publicados na rede SiBbr.

Este portal é baseado em um fork do software  [Canadensys-explorer](https://github.com/Canadensys/canadensys-explorer), o explorador de dados da rede Canadensys de biodiversidade.

##### Para saber mais sobre detalhes de instalação e implementação, visite nossa →[Wiki](https://github.com/sibbr/explorador/wiki)← #####

## Dependências

### Projetos
* [tile-server](https://github.com/sibbr/tile-server) (Responsável pela projeção dos pontos no mapa)
* [portal-web-theme](https://github.com/sibbr/canadensys-web-theme) (Front-end da aplicação)

### Softwares
* [Apache Server 2.2](http://httpd.apache.org/)
* [Tomcat 8](http://tomcat.apache.org/)
* [Postgresql 9.1](http://www.postgresql.org/)
* [Windshaft](https://github.com/CartoDB/Windshaft)

### Bibliotecas
* [Apache Maven 3](http://maven.apache.org/)
* [Spring Framework 4.0.2](http://www.springsource.org/spring-framework)
* [Canadensys Data Access 2.7.0](https://github.com/Canadensys/canadensys-data-access)
* [canadensys-web-core](https://github.com/Canadensys/canadensys-web-core)
* [Hibernate 4.3.2](http://www.hibernate.org/)
* [Freemarker 2.3.20](http://freemarker.sourceforge.net/)
* [SiteMesh 3.0.0](https://github.com/sitemesh/sitemesh2/)
* [Rewrite 2.0.12](https://github.com/ocpsoft/rewrite)
* [H2 Database 1.3.175](http://www.h2database.com) (testes unitários)
* [Selenium Client 2.39](http://docs.seleniumhq.org/download/) (testes de integração)
