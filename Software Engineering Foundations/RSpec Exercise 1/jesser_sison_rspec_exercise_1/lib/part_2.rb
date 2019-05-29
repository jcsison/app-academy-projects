def hipsterfy(str)
    arr = str.split("").reverse
    (0..arr.length - 1).each { |i|
        if "aeiou".include?(arr[i])
            arr.delete_at(i)
            return arr.reverse.join("")
        end
    }
    arr.reverse.join("")
end

def vowel_counts(str)
    str.split("").inject(Hash.new(0)) { |hash, char| hash[char.downcase] += 1 if "aeiou".include?(char.downcase); hash }
end

def caesar_cipher(str, num)
    letters = "abcdefghijklmnopqrstuvwxyz"
    str.split("").collect { |char|
        if letters.include?(char)
            letters[(letters.index(char) + num) % 26]
        else
            char
        end
    }.join("")
end
