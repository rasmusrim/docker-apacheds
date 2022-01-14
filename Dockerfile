FROM mcr.microsoft.com/windows/servercore:ltsc2019

RUN powershell -Command Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
RUN powershell -Command choco install openjdk8 -y
RUN powershell -Command wget https://dlcdn.apache.org//directory/apacheds/dist/2.0.0.AM26/apacheds-2.0.0.AM26.zip -OutFile .\apacheds.zip
RUN powershell -Command Expand-Archive .\apacheds.zip
WORKDIR c:/apacheds/apacheds-2.0.0.AM26/bin
RUN cpappend
ENTRYPOINT ["apacheds.bat"]
EXPOSE 10389 10636
