require 'minitest/spec'
require 'minitest/autorun'

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

describe "TextEvaluator" do
  it "should return true for palindrome? 'A man, a plan, a canal -- Panama'" do
    palindrome?('A man, a plan, a canal -- Panama').must_equal true
  end

  it "should return false for 'Abracadabra'" do
    palindrome?('Abracadabra').must_equal false
  end

  it "should ignore nonword characters" do
    palindrome?('A man, a plan,** a canal }%%-- Panama!!}*&').must_equal true
  end

  it 'counting words in "A man, a plan, a canal -- Panama" ' do
    count_words("A man, a plan, a canal -- Panama").must_equal({'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1})
  end

  it "counting words in 'Doo bee doo bee doo'" do
    count_words('Doo bee doo bee doo').must_equal( {'doo' => 3, 'bee' => 2})
  end
end
