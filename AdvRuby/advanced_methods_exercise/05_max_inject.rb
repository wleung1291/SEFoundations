# Write a method, max_inject(arr), that accepts any amount of numbers arguments and returns
# the largest number. Solve this using the built-in inject.

def max_inject(*arr)
    largest = 0

    arr.inject do |acc, ele|
        if ele > acc
            p 'ele'
            p ele
            ele 
        else
            p "acc"
            p acc
            acc
        end
    end
        
    #return largest
end

 max_inject(1, -4, 0, 7, 5)  # => 7
 max_inject(30, 28, 18)      # => 30
