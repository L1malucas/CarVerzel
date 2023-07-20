# CarVerzel

## Versões Usadas

- Frontend
  - Angular CLI: 16.1.4
  - Node: 18.16.1
  - Package Manager: npm 9.5.1
- Back
  - Dotnet: 6.0.x
  - Entity Framework Core: 6.0.x
  - Entity Framework Core SqlServer: 6.0.x
  - JwtBearer: 6.0.x
  - AspNetCore.Authorization: 6.0.x
- Mobile
  - SDK: 33
  - Flutter 3.10.5 
  - Dart 3.0.5 
  - DevTools 2.23.1

- Banco
  - SQL Server: 2022

# Passos iniciais
Angular
Cria o client do angular e roda `ng build`
Gera os componentes necessários
Dotnet
Cria um ASP.NET web api e adiciona os pacotes necessários
Gera os controllers, models e db context
Adiciona a string de conexão no `appsettings.json`
Adiciona o **dbcontext** no program.cs
Gera a migration inicial com o comando `dotnet ef migrations add inicial`
Caso ocorra tudo certo, rode `dotnet ef database update` 
Add Cors

