require 'fileutils'
require 'digest'
require 'date'
puts Dir.pwd
def myrmtree(imypath)
	`#{ARGV[2]}longpathgo.exe myrmtree "#{imypath}"`
end
def myosremove(imypath)
	myrmtree(imypath)
end
def wrap(mystr)
mystr.gsub('\\','/')
end
def wraper(ar)
ar.map {|myitem| wrap(myitem)}
end
def myexit
f.close
exit
end
def U(s)
s[0].capitalize+s[1..-1]
end
def fend(s)
if s[-1]=="/"
return s[0..-2]
else
return s
end
end
def norm(s)
wrap(fend(U(s)))
end
def p(a,okfile)
puts a
okfile.write(a+"\n")
end
def md5(myfile)
	`#{ARGV[2]}longpathgo.exe md5 "#{myfile}"`.chomp
end
def drop(x,sep)
x.split(sep)[0..-2].join(sep)
end
def mytype(ipath)
	`#{ARGV[2]}longpathgo.exe mytype "#{ipath}"`.chomp
end
def inbuffer(ipath,ibuffer)
ipath.include?ibuffer
end
def myfiles(ipath)
`#{ARGV[2]}longpathgo.exe myfiles "#{ipath}"`.chomp.split(",")
end
def isempty(ipath)
	myfiles(ipath).length==0
end
def readz(ipath,ito,ibuffer,okfile,gmyfrom,exe)
	#puts "ipath is #{ipath}"
	for i in myfiles(ipath)
		thisthing="#{ipath}/#{i}"
		#puts "thisthing is #{thisthing}"
		#puts "mytype is #{mytype(thisthing)}"
		#puts "File.file?#{thisthing} #{File.file?ipath}"
		imytype=mytype(thisthing)
		if imytype=='file'
			m=md5(thisthing)
			p(i,okfile)
			fcsv=File.open("#{$myto}/#{gmyfrom.split('/')[-1]} (#{Date.today.strftime('%d.%m.%Y')}).csv",'a')
			#puts "csv #{ipath},#{i},#{m}"
			fcsv.write("#{ipath.sub(ibuffer+"/",'')},#{i},#{m}\n")
			fcsv.close
			if inbuffer(ipath,ibuffer)
				myosremove(thisthing)
			end
		end
		if imytype=='archive'
			if inbuffer(ipath,ibuffer)
				mycmd="#{exe}7za.exe x \"\\\\?\\#{thisthing}\" -o\"\\\\?\\#{ipath}/#{drop(i,'.')}\" -aou".gsub('/',"\\")
				p(mycmd,okfile)
				system(mycmd)
				readz(ibuffer,ito,ibuffer,okfile,gmyfrom,exe)
				myosremove(thisthing)
			end
			if not inbuffer(ipath,ibuffer)
				#puts "gmyfrom is #{gmyfrom}"
				mycmd="#{exe}7za.exe x \"\\\\?\\#{thisthing}\" -o\"\\\\?\\#{ibuffer}#{ipath.sub(gmyfrom,'')}/#{drop(i,'.')}\" -aou".gsub('/',"\\")
				p(mycmd,okfile)
				system(mycmd)
				readz(ibuffer,ito,ibuffer,okfile,gmyfrom,exe)
			end
		end
		if imytype=='dir'
			if isempty(thisthing)
				if inbuffer(ipath,ibuffer)
					myrmtree(thisthing)
				end
			else
				readz(thisthing,ito,ibuffer,okfile,gmyfrom,exe)
				if isempty(thisthing)
					if inbuffer(ipath,ibuffer)
						myrmtree(thisthing)
					end
				end
			end
		end
	end
end		
=begin
exe=`where 7z`.chomp.gsub('\\','/').sub('/7z.exe','')
if not exe.match?(/[A-Z]\:\//)
puts 'Install 7za.exe http://www.7-zip.org/'
exit
end
=end
if ARGV.length!=3
puts 'md5scunerzrb[.exe] C:\empty\result\dir C:\source\dir\for\scan C:\dir\of\electron\exe\files'
exit
end
exe=ARGV[2]+"7z1805-extra/"
myto=ARGV[0]
myto=norm(myto)
$myto=myto
if not File.exist?myto
Dir.mkdir(myto)
end
if not isempty(myto)
puts "#{myto} is not empty"
exit
end
myfrom=ARGV[1]
myfrom=norm(myfrom)
if not File.exist?myfrom
puts "#{myfrom} is not exist"
exit
end
if isempty(myfrom)
puts "#{myfrom} is empty"
exit
end
mybuffer='C:/Windows/Temp/md5utils'
if File.exist?mybuffer
myrmtree(mybuffer)
end
Dir.mkdir(mybuffer)
f=File.open("#{myto}/mylog.txt",'w')
fcsv=File.open("#{myto}/#{myfrom.split('/')[-1]} (#{Date.today.strftime('%d.%m.%Y')}).csv",'a')
fcsv.write("path,name,md5\n")
fcsv.close
readz(myfrom,myto,mybuffer,f,myfrom,exe)
myrmtree(mybuffer)
f.close
