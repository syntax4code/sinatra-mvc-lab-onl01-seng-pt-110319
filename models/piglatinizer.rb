require 'pry'

class PigLatinizer
  def self.translate(phrase)
      phrase
        .split(/ /)
        .map {|word| PigLatin.new(word).translate}
        .join(" ")
    end
  
    def initialize(word)
      @word = word
    end
  
    def translate
      return "#{word}ay" if begins_with_vowel_sound?
      return "y#{word[0]}ay" if y_after_consonant?
      rot = begins_with_qu? ? 2 : 1
      PigLatin.new(word.chars.rotate(rot).join).translate
    end
  
    private
  
    attr_reader :word
  
    def begins_with_vowel_sound?
      word.start_with?("a", "e", "i", "o", "u", "xr", "yt")
    end
  
    def begins_with_qu?
      word.start_with?("qu")
    end
  
    def y_after_consonant?
      word.length == 2 && word[1] == "y"
    end
  
end
