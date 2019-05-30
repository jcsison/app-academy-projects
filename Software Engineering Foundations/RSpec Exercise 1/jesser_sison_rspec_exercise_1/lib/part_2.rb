def hipsterfy(str)
    arr = str.split("").reverse
    (0..arr.length - 1).each do |i|
        next unless "aeiou".include?(arr[i])
        arr.delete_at(i)
        return arr.reverse.join
    end
    arr.reverse.join
end

def vowel_counts(str)
    str.split("").each_with_object(Hash.new(0)) { |char, hash| hash[char.downcase] += 1 if "aeiou".include?(char.downcase) }
end

def caesar_cipher(str, num)
    letters = "abcdefghijklmnopqrstuvwxyz"
    str.split("").map { |char| letters.include?(char) ? letters[(letters.index(char) + num) % 26] : char }.join
end
