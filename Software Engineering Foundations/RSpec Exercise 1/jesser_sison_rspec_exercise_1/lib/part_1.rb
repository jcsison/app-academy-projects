def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(arr)
    arr.reduce(:+) / arr.length.to_f
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    arr = str.split()
    (0..arr.length - 1).collect { |i| arr[i] = i.even? ? arr[i].upcase : arr[i].downcase }.join(" ")
end
