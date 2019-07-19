# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num1, num2)
    #i = 2
    largest = 0

    # get the larger of the two nums for the stopping condition
    if num1 > num2
        largest = num1
    else 
        largest = num2
    end

    ## while loop checks if both nums are divisible from num1 to num2
    #while i <= largest 
    #    if num1 % i == 0 && num2 % i == 0
    #        return false
    #    end
    #    i += 1
    #end

    ###########################################################################

    #arr = []
    #arr << num1
    #arr << num2
    # loops till the largest number while checking if both nums have common divisor, ele
    #(2..largest).each do |ele|
    #    if num1 % ele == 0 && num2 % ele == 0
    #        return false
    #    end
    #end

    #return true
    
    ###########################################################################
    
    # returns true if no conditions eval to true and vice versa
    (2..largest).none? { |ele| num1 % ele == 0 && num2 % ele == 0 }

    
end


 p coprime?(25, 12)    # => true
 p coprime?(7, 11)     # => true
 p coprime?(30, 9)     # => false
 p coprime?(6, 24)     # => false
