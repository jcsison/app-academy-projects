def my_map(arr, &proc)
  arr.reduce([]) { |array, item| array << proc.call(item) }
end

def my_select(arr, &proc)
  arr.each_with_object([]) { |item, array| array << item if proc.call(item) }
end

def my_count(arr, &proc)
  arr.reduce(0) { |count, item| count += proc.call(item) ? 1 : 0 }
end

def my_any?(arr)
  arr.each { |item| return true if proc.call(item) }
  false
end

def my_all?(arr)
  arr.each { |item| return false if !proc.call(item) }
  true
end

def my_none?(arr)
  arr.each { |item| return false if proc.call(item) }
  true
end
