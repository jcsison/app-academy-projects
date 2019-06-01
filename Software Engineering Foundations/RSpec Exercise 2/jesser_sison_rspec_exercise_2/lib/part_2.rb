def palindrome?(str)
  str.length.times.all? { |i| str[i] == str[-(i + 1)] }
end

def substrings(str)
  str.length.times.each_with_object([]) do |i, array|
    (i..str.length - 1).each { |j| array << str[i..j] }
  end
end

def palindrome_substrings(str)
  substrings(str).select { |item| palindrome?(item) && item.length > 1 }
end
