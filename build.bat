@echo off

rmdir /s /q publish

cd src
rmdir /s /q bin
rmdir /s /q obj
dotnet publish SourceGit_48.csproj --nologo -c Release -r win-x64 -o ..\publish\net48
ilrepack /ndebug /out:..\publish\SourceGit.exe ..\publish\net48\SourceGit.exe ..\publish\net48\Newtonsoft.Json.dll
cd ..\publish
ren SourceGit.exe SourceGit_48.exe
rmdir /s /q net48

cd ..\src
rmdir /s /q bin
rmdir /s /q obj
dotnet publish SourceGit.csproj --nologo -c Release -r win-x64 -p:PublishSingleFile=true --no-self-contained -o ..\publish

cd ../