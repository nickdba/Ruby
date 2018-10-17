# Print side by side vids and subs
def print_side_by_side(vids, subs)
  for i in (0..vids.size-1) do 
    printf "%-60s %-60s\n", File.basename(vids[i]), File.basename(subs[i])
  end
end

# Mach subtitles names with video file names
def match_names(vids,subs)
  for i in (0..vids.size-1) do 
    vid = vids[i]; subt = subs[i] 
    File.rename(subt, vid.sub(/\.[^.]+\z/,subt[-4,4]))
  end
  print_side_by_side(vids,subs)
end

# Replace romanian chars with english onces
def replace_rom_chars(subs)
  subs.each do |subt|
    new_sub_text = File.read(subt).gsub("þ","t").gsub("º","s").gsub("ª","s")
    File.open(subt, "w") {|file| file.puts new_sub_text }
  end
end

#######################
# Main Body
#######################

# Get the current path
path = Dir.pwd+"/*"

# Loop menu
loop do

  # Reads the files from the current path
  vid_files = Dir["#{path}.avi", "#{path}.mpg", "#{path}.mkv"].sort
  sub_files = Dir["#{path}.srt", "#{path}.sub", "#{path}.txt"].sort
  
  # Print Menu
  printf("\n1. Print Side by Side\n2. Match Names\n3. Replace Romanian Chars\n0. Exit\n\nOption: ")
  opt = gets
  system "clear"

  # Action the option choosen
  case opt.to_i
    when 0; break
    when 1; print_side_by_side(vid_files, sub_files)
    when 2; match_names(vid_files, sub_files)
    when 3; replace_rom_chars(sub_files)
    else next
  end         
end
