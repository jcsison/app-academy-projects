class Array
  def my_each(&prc)
    for i in self.length.times do
      prc.call(self[i])
    end
  end

  def my_select(&prc)
    array = []
    self.my_each { |item| array << item if prc.call(item) }
    array
  end

  def my_reject(&prc)
    self.my_select { |item| !prc.call(item) }
  end

  def my_any?(&prc)
    self.each { |item| return true if prc.call(item) }
    false
  end

  def my_flatten
    return self[0].is_a?(Array) ? self[0].my_flatten : self if self.length == 1
    [*Array(self[0]).my_flatten, *Array(self[1..-1]).my_flatten]
  end

  def my_zip(*args)
    self.length.times.each_with_object([]) do |i, array|
      temp = [self[i]]
      args.each { |arr| temp << arr[i] }
      array << temp
    end
  end

  def my_rotate(n = 1)
    self.length.times.map { |i| self[(i + n) % self.length] }
  end

  def my_join(str = "")
    (0..self.length - 1).reduce("") do |joined_str, i|
      joined_str += self[i] + (i < self.length - 1 ? str : "")
    end
  end

  def my_reverse
    self.length.times.map { |i| self[-i - 1] }
  end
end
