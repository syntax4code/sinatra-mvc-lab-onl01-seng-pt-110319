require 'pry'

class PigLatinizer
  def translate(words)
      arr = []

    words.split.each{|word| arr.push word[0] == "a" || word[0] == "e" || word[0] == "i" || word[0] == "o" || word[0] == "u" ? word + "ay" : word[1..-1] + word[0] + "ay" }

    puts arr.join(" ")
    end


end
