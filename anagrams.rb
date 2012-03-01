require 'minitest/spec'
require 'minitest/autorun'

describe 'Anagram Analizer' do
  
  it "sort method should return a string with its sorted characters" do
    sort("acbdxi").must_equal( "abcdix")
  end

  it "should return grouped anagrams" do
     combine_anagrams(["rat", "tar", "art", "sapo", "sopa", "base"]).must_equal([["rat", "tar", "art"], ["sapo", "sopa"], ["base"]])
  end

  it "should return grouped anagrams" do
     combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']  ).must_equal([["cars", "racs", "scar"],["four"],["potatoes"],["for"] ,["creams", "scream"]])
  end

end

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



