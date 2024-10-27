filename = "text.txt"
list_of_words = []
class String
    def is_integer?
        self.to_i.to_s == self
    end
end
File.open(filename, "r") do |file|
  file.each_line do |line|
    words = line.split(/\W+/).map(&:downcase) 
    words.each do |word|
      if !list_of_words.include?(word)
        list_of_words << word
      end
    end
  end
end
puts "Words for you to learn:"
list_of_words = list_of_words.sort_by { |list_of_words| list_of_words }
puts list_of_words