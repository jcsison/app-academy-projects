def palindrome?(str)
    (0..str.length - 1).all? { |i| str[i] == str[-(i + 1)] }
end

def substrings(str)
    (0..str.length - 1).inject([]) { |array, i| (i..str.length - 1).each { |j| array << str[i..j] }; array }
end

def palindrome_substrings(str)
    substrings(str).select { |item| palindrome?(item) && item.length > 1 }
end
