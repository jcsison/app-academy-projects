# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
  compress = []
  repeat = 0
  str.length.times.each do |i|
    repeat += 1
    next unless str[i] != str[i + 1]
    compress << (repeat == 1 ? str[i] : repeat.to_s + str[i])
    repeat = 0
  end
  compress.join
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
