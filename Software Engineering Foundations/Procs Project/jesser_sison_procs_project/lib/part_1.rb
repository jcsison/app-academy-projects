def my_map(arr, &proc)
    arr.inject([]) { |array, item| array << proc.call(item) }
end

def my_select(arr, &proc)
    arr.inject([]) { |array, item| array << item if proc.call(item); array }
end

def my_count(arr, &proc)
    arr.inject(0) { |count, item| count += proc.call(item) ? 1 : 0 }
end

def my_any?(arr)
    arr.each { |item| return true if proc.call(item) }
    return false
end

def my_all?(arr)
    arr.inject(true) { |bool, item| bool = false if !proc.call(item); bool }
end

def my_none?(arr)
    arr.inject(true) { |bool, item| bool = false if proc.call(item); bool }
end
