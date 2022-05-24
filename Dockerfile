FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-stage

WORKDIR /source

#install node
RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash -
RUN apt-get install -y nodejs

#copy all
COPY . .

#publish
WORKDIR /source/DotnetTemplate.Web
RUN dotnet publish -c release -o /app


FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS run-stage
EXPOSE 5000
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "DotnetTemplate.Web.dll"]
