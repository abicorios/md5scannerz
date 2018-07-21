where choco /q
if not %errorlevel%==0 (start /wait cmd /c @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin")
rem C:\ProgramData\chocolatey\bin\RefreshEnv)
where 7z /q
if not %errorlevel%==0 (start /wait cmd /c choco install 7zip -y)
where git
if not %errorlevel%==0 (start /wait cmd /c choco install git -y)
where go /q
if not %errorlevel%==0 (start /wait cmd /c choco install golang --x86 -y)
where ruby /q
if not %errorlevel%==0 (start /wait cmd /c choco install ruby --x86 -y -f
start /wait cmd /c choco install ruby --x86 -y -f)
where ocra /q
if not %errorlevel%==0 (start /wait cmd /c gem install ocra)
where node /q
if not %errorlevel%==0 (start /wait cmd /c choco install nodejs --x86 -y -f
start /wait cmd /c choco install nodejs --x86 -y -f)
where vim
if not %errorlevel%==0 (start /wait cmd /c choco install vim -y)
if not exist compileIfChanged start /wait cmd /c git clone https://github.com/abicorios/compileIfChanged
if not exist compileIfChanged.exe start /wait cmd /c go build compileIfChanged\compileIfChanged.go
if not exist longpathgo.exe start /wait cmd /c go build longpathgo.go
compileIfChanged.exe longpathgo.go longpathgo.exe go build longpathgo.go
if not exist md5scannerzrb.exe start /wait cmd /c "ocra md5scannerzrb.rb"
compileIfChanged.exe md5scannerzrb.rb md5scannerzrb.exe ocra md5scannerzrb.rb
if not exist md5scanerz start /wait cmd /c "git clone https://github.com/szwacz/electron-boilerplate.git md5scanerz && cd md5scanerz && npm install"
start /wait cmd /c vim -c %%s/\d\{2\}\.\d\{2\}.\d\{4\}/%date:~-7,-5%.%date:~-10,-8%.%date:~-4%/ -c x app.html
if not exist md5scannerzgo start /wait cmd /c git clone https://github.com/abicorios/md5scannerzgo
if not exist md5scannerzgo.exe start /wait cmd /c go build md5scannerzgo\md5scannerzgo.go
