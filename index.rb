text = ARGV[0]
words = {}      
delimiters = [" ", "*", "'", "\"","#","^", "@", ":", ";", ".", "!", "(", ")","1","2","3","4","5","6","7","8","9","0","\n","[","]","{","}","\"",",","&nbsp","“","‘","”", "%"," &lt", "&gt","?","-"]
files = Dir.entries(text)
files = files.reject { |line| line == "." || line == ".." }
def remove(text)
  text.gsub(/<\/?\w+(?:\s+\w+(?:\s*=\s*(?:".*?"|'.*?'|[^'">\s]+))?)*\s*\/?>/m, '')
end             
number = 0
files.each do |file|   
  lines = File.readlines(text.to_s + "/" + file.to_s)  
  lines = remove(lines.join(' '))
  lines = lines.split(" ")
  lines.each do |l|
    l.split(Regexp.union(delimiters)).each do |w|
      # if !words.key(w) && w != ""
        words[:"#{w}"] = true
      # end           
    end          
  end             
  files = file
  number+=1    
end       
textfile = File.new("words.txt", "w")
textfile.puts(words.keys)
textfile.close 
