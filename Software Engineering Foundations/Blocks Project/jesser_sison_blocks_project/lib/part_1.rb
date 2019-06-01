def select_even_nums(arr)
  arr.select(&:even?)
end

def reject_puppies(arr)
  arr.reject { |hash| hash["age"] <= 2 }
end

def count_positive_subarrays(arr)
  arr.count { |sub_arr| sub_arr.reduce(:+) > 0 }
end

def aba_translate(str)
  str.split("").map {
    |char| "aeiou".include?(char) ? char + "b" + char : char
  }.join
end

def aba_array(arr)
  arr.map(&method(:aba_translate))
end
