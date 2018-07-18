where choco /q
if not %errorlevel%==0 (start /wait cmd /c @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin")
rem C:\ProgramData\chocolatey\bin\RefreshEnv)
where 7z /q
if not %errorlevel%==0 (start /wait cmd /c choco install 7zip -y)
rem refreshenv)
where go /q
if not %errorlevel%==0 (start /wait cmd /c choco install golang --x86 -y)
rem refreshenv)
where ruby /q
if not %errorlevel%==0 (start /wait cmd /c choco install ruby --x86 -y)
rem refreshenv)
where ocra /q
if not %errorlevel%==0 (start /wait cmd /c gem install ocra)
where git
if not %errorlevel%==0 (start /wait cmd /c choco install git -y)
rem refreshenv)
where node /q
if not %errorlevel%==0 (start /wait cmd /c choco install nodejs --x86 -y)
rem refreshenv)
where vim
if not %errorlevel%==0 (start /wait cmd /c choco install vim -y)
rem refreshenv)
if not exist longpathgo.exe start /wait cmd /c go build longpathgo.go
for %%f in ("longpathgo.exe") do set mylongpathgoexe=%%~tf
for %%f in ("longpathgo.go") do set mylongpathgo=%%~tf
if "%mylongpathgoexe%" lss "%mylongpathgo%" start /wait cmd /c go build longpathgo.go
if not exist md5scannerzrb.exe start /wait cmd /c "ocra md5scannerzrb.rb"
for %%f in ("md5scannerzrb.exe") do set mymd5scannerzrbexe=%%~tf
for %%f in ("md5scannerzrb.rb") do set mymd5scannerzrb=%%~tf
if "%mymd5scannerzrbexe%" lss "%mymd5scannerzrb%" start /wait cmd /c "ocra md5scannerzrb.rb"
if not exist md5scanerz start /wait cmd /c "git clone https://github.com/szwacz/electron-boilerplate.git md5scanerz && cd md5scanerz && npm install"
start /wait cmd /c vim -c %%s/\d\{2\}\.\d\{2\}.\d\{4\}/%date:~-7,-5%.%date:~-10,-8%.%date:~-4%/ -c x app.html
