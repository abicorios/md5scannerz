where 7z /q
if not %errorlevel%==0 (choco install 7zip --x86 -y)
where git /q
if not %errorlevel%==0 (choco install git --x86 -y)
where go /q
if not %errorlevel%==0 (choco install golang --x86 -y)
where ruby /q
if not %errorlevel%==0 (choco install ruby --x86 -y)
where node /q
if not %errorlevel%==0 (choco install nodejs --x86 -y)
where vim /q
if not %errorlevel%==0 (start https://ftp.nluug.nl/pub/vim/pc/gvim81.exe)
exit
