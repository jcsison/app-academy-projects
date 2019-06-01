def hipsterfy(str)
  arr = str.split("").reverse
  arr.length.times.each do |i|
    next unless "aeiou".include?(arr[i])
    arr.delete_at(i)
    return arr.reverse.join
  end
  arr.reverse.join
end

def vowel_counts(str)
  str.split("").each_with_object(Hash.new(0)) do |char, hash|
    hash[char.downcase] += 1 if "aeiou".include?(char.downcase)
  end
end

def caesar_cipher(str, num)
  alph = "abcdefghijklmnopqrstuvwxyz"
  str.split("").map {
    |char| alph.include?(char) ? alph[(alph.index(char) + num) % 26] : char
  }.join
end
