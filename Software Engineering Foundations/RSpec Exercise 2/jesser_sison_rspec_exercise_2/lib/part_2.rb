def palindrome?(str)
    (0..str.length - 1).all? { |i| str[i] == str[-(i + 1)] }
end

def substrings(str)
    (0..str.length - 1).each_with_object([]) { |i, array| (i..str.length - 1).each { |j| array << str[i..j] } }
end

def palindrome_substrings(str)
    substrings(str).select { |item| palindrome?(item) && item.length > 1 }
end
