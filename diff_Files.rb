#!/usr/bin/env ruby

#this opens winmerge to compare files side by side in a diff
OutPath="C:/rubyProject/regression"
ExpectedPath="C:/miscellaneous"

fullFileName = File.join(OutPath, "**", "*.Asset.xml")
fullExpected = File.join(ExpectedPath, "**", "*.Asset.Expected.xml")


Dir.glob(fullExpected).each do |g|
# puts g
 Dir.glob(fullFileName).each do |f|
  if File.basename(g, '.Asset.Expected.xml') == File.basename(f, '.Asset.xml') then
  #puts f
  #open the file and remove carriage returns
  txt1 = Array.new
  txt2 = Array.new
  file = File.open("#{g}", 'r')
    while !file.eof?
    txt1 << file.readline.strip
    end
  file = File.open("#{f}", 'r')
    while !file.eof?
    txt2 << file.readline.strip
    end
   
   
  unless txt1 == txt2 then
  system('start "WinMerge" /B "C:\\Program Files (x86)\\WinMerge\\WinMergeU.exe" /e /s /u ' + "#{g} " + "#{f}") 
  end  #end of unless
  
  end #end of basename if condition
  
 end # end of iteration for f
end