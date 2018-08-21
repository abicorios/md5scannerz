2make.bat
copy app.html md5scannerz\app /y
copy app.js md5scannerz\src /y
if not exist md5scannerz\resources\app mkdir md5scannerz\resources\app
copy md5scannerzgo.exe md5scannerz\resources\app /y
copy md5scannerzgo.exe md5scannerz /y
copy package.json md5scannerz\package.json /y
xcopy 7z1805-extra md5scannerz\7z1805-extra\ /s /y
xcopy 7z1805-extra md5scannerz\resources\app\7z1805-extra\ /s /y
start cmd /c "cd md5scannerz && npm start"
