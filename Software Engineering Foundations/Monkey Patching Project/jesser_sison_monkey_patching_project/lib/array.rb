# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    self.max - self.min if self.length > 0
  end

  def average
    self.reduce(:+) / self.length.to_f if self.length > 0
  end

  def median
    if self.length > 0
      (self.sort[(self.length - 1) / 2] + self.sort[self.length / 2]) / 2.0
    end
  end

  def counts
    self.each_with_object(Hash.new(0)) { |item, hash| hash[item] += 1 }
  end

  def my_count(value)
    self.reduce(0) { |count, item| count += item == value ? 1 : 0 }
  end

  def my_index(value)
    if self.include?(value)
      self.each_with_index { |item, i| return i if item == value }
    end
  end

  def my_uniq
    self.each_with_object([]) do |item, array|
      array << item if !array.include?(item)
    end
  end

  def my_transpose
    self.length.times.map { |i| self.length.times.map { |j| self[j][i] } }
  end
end
