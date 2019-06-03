# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
def least_common_multiple(num_1, num_2)
  ((num_1 >= num_2 ? num_1 : num_2)..(num_1 * num_2)).each do |n|
    return n if n % num_1 == 0 && n % num_2 == 0
  end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
  largest = ["", 0]
  (0..str.length - 2).each_with_object(Hash.new(0)) do |i, substrings|
    substrings[str[i..i + 1]] += 1
    if substrings[str[i..i + 1]] > largest[1]
      largest = [str[i..i + 1], substrings[str[i..i + 1]]]
    end
  end
  largest[0]
end


class Hash
  # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
  def inverse
    self.to_a.map { |array| [array[1], array[0]] }.to_h
  end
end


class Array
  # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
  def pair_sum_count(num)
    self.length.times.reduce(0) do |count, i|
      (i..self.length - 1).each { |j| count += 1 if self[i] + self[j] == num }
      count
    end
  end


  # Write a method, Array#bubble_sort, that takes in an optional proc argument.
  # When given a proc, the method should sort the array according to the proc.
  # When no proc is given, the method should sort the array in increasing order.
  def bubble_sort(&prc)
    prc ||= proc { |a, b| a <=> b }
    nil while (0..self.length - 2).any? do |i|
      if prc.call(self[i], self[i + 1]) == 1
        self[i], self[i + 1] = self[i + 1], self[i] 
      end
    end
    self
  end
end
