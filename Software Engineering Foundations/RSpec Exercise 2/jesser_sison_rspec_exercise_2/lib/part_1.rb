def partition(arr, num)
    p1 = []
    p2 = []
    arr.each { |n| if n < num then p1 << n else p2 << n end }
    [p1, p2]
end

def merge(hash1, hash2)
    hash = Hash.new(0)
    hash1.each { |key, value| hash[key] = value }
    hash2.each { |key, value| hash[key] = value }
    hash
end

def censor(str, arr)
    str.split.map { |word|
        arr.include?(word.downcase) ? word.split("").map { |char|
            "aeiou".include?(char.downcase) ? "*" : char
        }.join : word
    }.join(" ")
end

def power_of_two?(num)
    return false if (num > 1 && num < 2) || num <= 0
    return true if num == 1 || num == 2
    power_of_two?(num / 2.0)
end
