where choco /q
if not %errorlevel%==0 (start /wait cmd /c @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin")
where 7z /q
if not %errorlevel%==0 (start /wait cmd /c choco install 7zip -y)
where git /q
if not %errorlevel%==0 (start /wait cmd /c choco install git -y)
where go /q
if not %errorlevel%==0 (start /wait cmd /c choco install golang --x86 -y)
where ruby /q
if not %errorlevel%==0 (start /wait cmd /c choco install ruby -y -f)
where node /q
if not %errorlevel%==0 (start /wait cmd /c choco install nodejs --x86 -y -f)
where vim /q
if not %errorlevel%==0 (start /wait cmd /c choco install vim -y)
if not exist compileIfChanged start /wait cmd /c git clone https://github.com/abicorios/compileIfChanged
if not exist compileIfChanged.exe start /wait cmd /c go build compileIfChanged\compileIfChanged.go
if not exist md5scanerz start /wait cmd /c "git clone https://github.com/szwacz/electron-boilerplate.git md5scanerz && cd md5scanerz && npm install"
start /wait cmd /c ruby date.rb
where node
if %errorlevel%==0 if not exist md5scannerzgo start /wait cmd /c git clone https://github.com/abicorios/md5scannerzgo
copy md5scannerzgo\md5scannerzgo.go
if not exist md5scannerzgo.exe start /wait cmd /c go build md5scannerzgo.go
compileIfChanged.exe md5scannerzgo.go md5scannerzgo.exe go build md5scannerzgo.go
xcopy md5scannerzgo\7z1805-extra 7z1805-extra\ /s /y
