# Write a method, is_sorted(arr), that accepts an array of numbers as an arg.
# The method should return true if the elements are in increasing order, false otherwise.
# Do not use the built-in Array#sort in your solution :)

def is_sorted(arr)
    #i = 0
    #sorted = false
#
    #while i < arr.length-1
    #    sorted = false
    #    if arr[i] <= arr[i + 1]
    #        sorted = true
    #    else 
    #        return sorted 
    #    end
    #    i += 1
    #end

    #return sorted

    # loops through the length of the array
    (0...arr.length - 1).each do |i|
        # return false if the preceding element is smaller than its next element
        return false if arr[i] > arr[i + 1]
    end

    return true
end

p is_sorted([1, 4, 10, 13, 15])       # => true
p is_sorted([1, 4, 10, 10, 13, 15])   # => true
p is_sorted([1, 2, 5, 3, 4 ])         # => false
