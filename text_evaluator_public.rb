def palindrome?( evaluable_text )
  clean_text = evaluable_text.gsub(/(\W|\d)/, '').downcase
  return clean_text.reverse == clean_text
end

def count_words( evaluable_text )
  words = evaluable_text.downcase.split( /\W/ )

  result = words.inject({}) do | result , word | 
    result[word] = result[word]? result[word] + 1 : 1 if word.length > 0
  result
  end

  return result
end

