# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    big = 0
    prime = 0
    
    return false if num < 2

    # num is the only prime
    return num if prime?(num)
        
    # loops in reverse and returns the largest and first divisible prime
    j = num - 1
    while j > 1
        if num % j == 0 && prime?(j)
            return j
        end
        j -= 1
    end
end

def prime? (num)
    # returns true or false depending on if num is prime
    return (2...num).none?{ |i| num % i == 0 }
end

############################################################################
# should accept a string as an arg
# when there are no duplicate characters in the string, should return true
# when there are duplicate characters in the string. should return false

def unique_chars?(str)
    count = 0
    char = []

    str.each_char do |ch|
        if char.include?(ch)
            return false
        end
        char << ch
    end

    return true
end

############################################################################
#   should accept an array as an arg
#   should return an hash where keys are the elements that were repeated in 
#   the array and values are the indices where that element appears

def dupe_indices(array)
    hash = Hash.new{ |k, v| k[v] = [] }

    array.each_with_index do |char, i|
        hash[char] << i
    end

    return hash.select { |k, v| v.length > 1 }

end

############################################################################
#   should accept two arrays as args
#   should not use Array#sort
#   when the arrays contain the same elements, in any order, should return true 
#   when the arrays do not contain the same elements, should return false 

def ana_array(arr1, arr2)

    if arr_to_hash(arr1) == arr_to_hash(arr2)
        return true
    else
        return false
    end
end

def arr_to_hash (array)
    hash = Hash.new{0}

    array.each do |ele|
        hash[ele] += 1
    end

    return hash
end