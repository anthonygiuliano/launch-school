class String
  def sort
    self.chars.sort.join
  end
end

class Anagram
  def initialize(word)
    @word = word.downcase
    @sorted_word = @word.sort
  end

  def match(word_array)
    sorted_words_array = word_array.map(&:downcase).map(&:sort)
    word_indices = sorted_words_array.map.with_index do |word, i|
      i unless word != @sorted_word || word_array.map(&:downcase)[i] == @word
    end.compact
    word_indices.map { |i| word_array[i] }
  end
end
