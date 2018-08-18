start /wait cmd /c "make.bat"
copy app.html md5scanerz\app /y
copy app.js md5scanerz\src /y
if not exist md5scanerz\resources\app mkdir md5scanerz\resources\app
copy package.json md5scanerz\package.json /y
xcopy 7z1805-extra md5scanerz\7z1805-extra\ /s /y
xcopy 7z1805-extra md5scanerz\resources\app\7z1805-extra\ /s /y
start /wait cmd /c "cd md5scanerz && npm run release"
copy  md5scanerz\dist\md5scannerz* /y
