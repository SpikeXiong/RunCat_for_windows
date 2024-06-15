@echo off
chcp 936

set PROJECT_PATH=RunCat\RunCat.csproj
set PUBLISH_PROFILE=RunCat\Properties\PublishProfiles\PublishProfile.pubxml
set PYINSTALLER_EXE=gifToico.exe
set PYINSTALLER_SCRIPT=GifToIcos\gifToico.py
set GIFTOICOSEXE=GifToIcos\dist\gifToico.exe

dotnet msbuild "%PROJECT_PATH%" -t:publish -p:PublishProfile=%PUBLISH_PROFILE%

if %ERRORLEVEL% neq 0 (
    echo 发布失败。
    exit /b %ERRORLEVEL%
)

echo 构建 %PYINSTALLER_EXE%
pyinstaller --onefile %PYINSTALLER_SCRIPT%

echo 将 %PYINSTALLER_EXE% 复制到发布目录

xcopy /Y %GIFTOICOSEXE% "RunCat\bin\publish" 

echo 发布成功。