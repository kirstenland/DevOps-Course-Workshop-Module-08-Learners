FROM mcr.microsoft.com/dotnet/sdk:6.0 AS base
EXPOSE 5000
RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash -
RUN apt-get install -y nodejs
COPY . .
RUN dotnet build
WORKDIR /DotnetTemplate.Web
RUN npm install
RUN npm run build
ENTRYPOINT [ "dotnet", "run" ]