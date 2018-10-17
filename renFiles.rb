files = Dir["./*.*"]
puts files
print "Reg Exp:"
reg = gets; reg = Regexp.new reg.chomp
print "String:"
str = (gets).chomp

puts reg

files.each do |file| 
  newfile = file.sub(reg, str)
  File.rename(file, newfile)
end

system("clear")
files = Dir["./*.*"]
puts files

