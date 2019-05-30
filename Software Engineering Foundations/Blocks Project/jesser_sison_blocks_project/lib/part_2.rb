def all_words_capitalized?(arr)
    arr.all? { |str| str[0] == str[0].upcase && str[1..-1] == str[1..-1].downcase }
end

def no_valid_url?(arr)
    arr.none? { |str| %w[com net io org].include?(str.split(".")[1]) }
end

def any_passing_students?(arr)
    arr.any? { |hash| hash[:grades].reduce(:+) / hash[:grades].length.to_f >= 75 }
end
