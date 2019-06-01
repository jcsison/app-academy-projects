def reverser(str, &proc)
  proc.call(str.reverse)
end

def word_changer(str, &proc)
  str.split.map { |word| proc.call(word) }.join(" ")
end

def greater_proc_value(num, proc1, proc2)
  proc1.call(num) >= proc2.call(num) ? proc1.call(num) : proc2.call(num)
end

def and_selector(arr, proc1, proc2)
  arr.select { |item| proc1.call(item) && proc2.call(item) }
end

def alternating_mapper(arr, proc1, proc2)
  arr.length.times.map do |i|
    i.even? ? proc1.call(arr[i]) : proc2.call(arr[i])
  end
end
