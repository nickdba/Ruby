path = Dir.pwd+"/*"
vid_files = Dir["#{path}.avi", "#{path}.mpg", "#{path}.mkv"].sort
sub_files = Dir["#{path}.srt", "#{path}.sub", "#{path}.txt"].sort

def print_side_by_side(vids, subs)
  for i in (1..vids.size) do puts "#{vids[i]} \t\t #{subs[i]}" end
end

# Replace romanian chars with english onces
def replace_rom_chars(subs)
  subs.each do |sub|
    new_sub_text = File.read(sub).gsub("aa","t").gsub("bb","s").gsub("cc","s")
    File.open(sub, "w") {|file| file.puts new_sub_text }
  end
end

# Mach subtitles names with video file names
def match_names(vids,subs)
  sub_files.each_with_index do |sub,i| 
    new_sub = vid_files[i] 
    newsub[-3,3] = sub[-3,3])
  end
end

#file_names.each do |file_name|
#  text = File.read(file_name)
#  new_contents = text.gsub(/search_regexp/, "replacement string")
#
#  # To write changes to the file, use:
#  File.open(file_name, "w") {|file| file.puts new_contents }
#end
