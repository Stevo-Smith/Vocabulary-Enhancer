text = File.read('text.txt')
words = {}
delimiters = [", ", " ", "'", "\"", ":", ";", ".", "!", "(", ")"]

lines = text.split("\n");

lines.each do |l|
  l.split(Regexp.union(delimiters)).each do |w|
    if !words.key(w) && w != ""
      words[:"#{w}"] = true
    end
  end
end

puts words.keys
