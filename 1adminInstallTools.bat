where choco /q
if not %errorlevel%==0 (@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
call C:\ProgramData\chocolatey\bin\refreshenv)
set f=0
where 7z /q
if not %errorlevel%==0 (choco install 7zip --x86 -y
set f=1)
where git /q
if not %errorlevel%==0 (choco install git --x86 -y
set f=1)
where go /q
if not %errorlevel%==0 (choco install golang --x86 -y
set f=1)
where ruby /q
if not %errorlevel%==0 (choco install ruby --x86 -y
set f=1)
where node /q
if not %errorlevel%==0 (choco install nodejs --x86 -y
set f=1)
rem if not %errorlevel%==0 start https://ftp.nluug.nl/pub/vim/pc/gvim81.exe
if %f% equ 1 call refreshenv
set f=
