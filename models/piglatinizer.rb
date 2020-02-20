require 'pry'

class PigLatinizer

  def piglatinize(input_str)
    piglatinize_word(input_str)
    input_str.split(" ").count > 1 ?  piglatinize_sentence(input_str) : piglatinize_word(input_str)
  end

  def piglatinize_word(word)
    if word[0].match(/[aAeEiIoOuU]/)
       word = word + "w"
    else
      letter_array = word.split("")
      con = []
      while !letter_array.first.match(/[aAeEiIoOuU]/)
        con << letter_array.shift
      end
      word = letter_array.join("") + con.join("")
    end
    word + "ay"
  end

  def piglatinize_sentence(sentence)
    word_array = sentence.split(" ")
    new_word_array = []
    word_array.each {|word| new_word_array << piglatinize_word(word)}
    new_word_array.join(" ")
  end
end
