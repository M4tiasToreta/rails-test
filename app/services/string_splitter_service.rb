# fronzen_literal_string: true

class StringSplitterService
  def initialize(string_value)
    @string_value = string_value
  end

  def call
    all_letter_list = @string_value.downcase.split ''
    count_letters(all_letter_list)
  end

  def count_letters(all_letter_list)
    hash = {}
    all_letter_list.each do |letter|
      if hash.keys.include?(letter)
        hash[letter] += 1
      else
        hash[letter] = 1
      end
    end
    hash
  end
end