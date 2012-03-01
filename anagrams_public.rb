def sort( text )
  return text.split(//).sort.join
end

def combine_anagrams( word_list )
  unique_list = []
  result = []
  word_list.each do |word|
    sorted_word = sort( word.downcase )
    index = unique_list.index sorted_word

    unless unique_list.include? sorted_word
      unique_list.push sorted_word 
      result.push []
      index = unique_list.index sorted_word
    end
    
    result[ index ].push word
  end

  return result
end

