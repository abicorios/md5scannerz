require 'date'
f=File.read("package.json")
regv=/(\d+\.){2}\d+/
v=f[/version.*\n/][regv]
source=File.read("app.html")
source2=source.gsub(/(?<=v)(\d+\.){2}\d+/,v)
date=Date.today.strftime("%d.%m.%Y")
source3=source2.gsub(/(\d{2}\.){2}\d{4}/,date)
File.open("app.html","w") {|f| f.puts source3}
