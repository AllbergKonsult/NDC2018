FROM microsoft/dotnet:1.1.1-sdk

RUN mkdir /app
WORKDIR /app

COPY dotnetapp.csproj /app/
RUN dotnet restore

COPY . /app/
RUN dotnet publish -c Release -o out

EXPOSE 5000/tcp
CMD ["dotnet", "out/dotnetapp.dll"]
