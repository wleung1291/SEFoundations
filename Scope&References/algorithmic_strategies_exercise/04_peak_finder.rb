# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.

def peak_finder(arr)
    peak = []
    
    if arr.length == 1
        return arr
    end

    # loops through the 2nd element to the 2nd to last element
    arr.each_with_index do |ele, i|
        left = arr[i - 1]
        right = arr[i + 1]

        # check the first element
        if i == 0 && ele > right
            peak << ele
        # check the middle elements
        elsif i > 0 && i < arr.length - 1
            if ele > left && ele > right
                peak << ele
            end
        # check the last element
        elsif i == arr.length - 1 && ele > left
            peak << ele
        end
    end

    return peak
end

p peak_finder([1])  
p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
