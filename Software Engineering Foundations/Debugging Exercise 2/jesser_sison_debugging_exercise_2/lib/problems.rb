# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require("byebug")

def largest_prime_factor(num)
    (1..num).select { |n| num % n == 0 }.reverse.find { |factor| (2..factor / 2).all? { |n| factor % n != 0 } }
end

def unique_chars?(str)
    str.split("").each_with_object(Hash.new(0)) { |char, hash| hash[char] += 1 }.to_a.all? { |arr| arr[1] == 1 }
end

def dupe_indices(arr)
    (0..arr.length - 1).each_with_object(Hash.new { |hash, key| hash[key] = [] }) { |i, hash| hash[arr[i]] << i }.delete_if { |key, value| value.length < 2 }
end

def ana_array(arr1, arr2)
    arr1.each_with_object(Hash.new(0)) { |char, hash| hash[char] += 1 } == arr2.each_with_object(Hash.new(0)) { |char, hash| hash[char] += 1 }
end
