FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR \app
COPY . .
EXPOSE 80
ENTRYPOINT ["dotnet", "WebApplication1.dll"]