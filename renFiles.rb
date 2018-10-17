files = Dir["./*.*"]

puts files
print "/Reg Exp/:"
reg = gets
print "String:"
str = gets

files.each do |file| 
  newfile = file.sub("/\.balarii/", ".x265")   #(reg, str)
  File.rename(file, newfile)
end

system ("clear")
puts files

