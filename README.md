portal-biodiversidade
=====================

Portal de dados de biodiversidade do Sistema de Informação sobre a Biodiversidade Brasileira.

Este portal exibe os dados e metadados sobre conjuntos de dados e listas de espécies publicados na rede SiBbr.

Este portal é baseado em um fork do software do [Canadensys-explorer](https://github.com/Canadensys/canadensys-explorer), o explorador de dados da rede Canadensys de biodiversidade.

Para saber mais, visite nossa [wiki](https://github.com/sibbr/portal-biodiversidade/wiki)

Dependências
------------

### Projects
* [canadensys-explorer](https://github.com/Canadensys/canadensys-explorer)
* [canadensys tile-server](https://github.com/Canadensys/tile-server)
* [canadensys-web-theme](https://github.com/Canadensys/canadensys-web-theme)
* [canadensys-web-core](https://github.com/Canadensys/canadensys-web-core)

### Softwares
* [Apache Server 2.2](http://httpd.apache.org/)
* [Tomcat 8](http://tomcat.apache.org/)
* [Postgresql 9.1](http://www.postgresql.org/)
* [Windshaft](https://github.com/CartoDB/Windshaft)

### Libraries
* [Apache Maven 3](http://maven.apache.org/)
* [Spring Framework 4.0.2](http://www.springsource.org/spring-framework)
* [Canadensys Data Access 2.7.0](https://github.com/Canadensys/canadensys-data-access)
* [Hibernate 4.3.2](http://www.hibernate.org/)
* [Freemarker 2.3.20](http://freemarker.sourceforge.net/)
* [SiteMesh 3.0.0](https://github.com/sitemesh/sitemesh2/)
* [Rewrite 2.0.12](https://github.com/ocpsoft/rewrite)
* [H2 Database 1.3.175](http://www.h2database.com) (for unit testing only)
* [Selenium Client 2.39](http://docs.seleniumhq.org/download/) (for integration testing)

Build
-----
Para construir a aplicação, por favor siga as instruções detalhadas em [wiki](https://github.com/sibbr/portal-biodiversidade/wiki).
```
gradle clean buildProduction
```

Testes
-----
Testes unitários

```
gradle clean test
```
