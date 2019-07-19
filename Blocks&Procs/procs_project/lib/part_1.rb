# should accept an array and a block as args
# should return a new array where the elements are the results of the block 
# when passed in each element of the original array
# should not use the built-in Array#map

def my_map(array, &prc)
    newArr = []

    array.each { |ele| newArr << prc.call(ele) }

    return newArr
end

########################################################################
# my_select
#   should accept an array and a block as args 
#   should return a new array where the elements are elements of the original 
#   array where the block resulted in true 
#   should not use the built-in Array#select

def my_select(array, &prc)
    newArr = []

    array.each do |ele| 
        if prc.call(ele) 
            newArr << ele
        end
    end

    return newArr
end

########################################################################
# my_count
#   should accept an array and a block as args 
#   should return a number representing the count of elements that result in 
#   true when passed into the block 
#   should not use the built-in Array#count 

def my_count(array, &prc)
    trueCount = 0

    array.each do |ele|
        if prc.call(ele)
            trueCount += 1
        end
    end
    
    return trueCount
end

########################################################################
# my_any?
#   should accept an array and a block as args 
#   should not use the built-in Array#any? 
#   when at least 1 element of the array results in true when passed into the block
#     should return true 
#   when all elements of the array result in false when passed into the block
#     should return false 

def my_any?(array, &prc)

    array.each { |ele| return true if prc.call(ele) }
    
    return false
end

########################################################################
# my_all?
#   should accept an array and a block as args 
#   should not use the built-in Array#all? 
#   when all elements of the array result in true when passed into the block
#     should return true 
#   when at least 1 of the elements of the array result in false when passed into the block
#     should return false 

def my_all?(array, &prc)

    array.each { |ele| return false if !prc.call(ele) }

    return true

end

########################################################################
# my_none?
#   should accept an array and a block as args 
#   should not use the built-in Array#none? 
#   when none of the elements of the array result in true when passed into the block
#     should return true 
#   when at least 1 element of the array results in true when passed into the block
#     should return false 

def my_none?(array, &prc)

    array.each { |ele| return false if prc.call(ele) }

    return true
end
