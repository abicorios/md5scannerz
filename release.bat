start /wait cmd /c "make.bat"
copy app.html md5scanerz\app /y
copy app.js md5scanerz\src /y
if not exist md5scanerz\resources\app mkdir md5scanerz\resources\app
copy longpathgo.exe md5scanerz\resources\app /y
copy longpathgo.exe md5scanerz /y
copy md5scannerzrb.exe md5scanerz\resources\app /y
copy md5scannerzrb.exe md5scanerz /y
copy package.json md5scanerz\package.json /y
start cmd /c "cd md5scanerz && npm run release"
