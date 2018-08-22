call 1adminInstallTools.bat
if not exist compileIfChanged git clone https://github.com/abicorios/compileIfChanged
start /wait cmd /c "cd compileIfChanged && git pull"
if not exist compileIfChanged.exe go build compileIfChanged\compileIfChanged.go
compileIfChanged.exe compileIfChanged\compileIfChanged.go compileIfChanged.exe go build compileIfChanged\compileIfChanged.go
if not exist md5scannerz start /wait cmd /c "git clone https://github.com/szwacz/electron-boilerplate.git md5scannerz && cd md5scannerz && npm install"
ruby date.rb
if not exist md5scannerzgo git clone https://github.com/abicorios/md5scannerzgo
start /wait cmd /c "cd md5scannerzgo && git pull"
if not exist md5scannerzgo.exe go build md5scannerzgo\md5scannerzgo.go
compileIfChanged.exe md5scannerzgo\md5scannerzgo.go md5scannerzgo.exe go build md5scannerzgo\md5scannerzgo.go
if not exist 7z1805-extra xcopy md5scannerzgo\7z1805-extra 7z1805-extra\ /s /y
