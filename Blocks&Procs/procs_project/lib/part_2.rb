# reverser
#   should accept a string and a block as args 
#   should return the result of the block when passed the string with it's 
#   characters reversed 

def reverser(string, &prc)

    reverse = string.reverse()

    return prc.call(reverse) 
end

########################################################################
# word_changer
#   should accept a sentence string and a block as args 
#   should return a new sentence where every word becomes the result of the 
#   block when passed the original word of the sentence 

def word_changer(string, &prc)
    newStr = string.split(" ")
    newArr = []

    newStr.each { |ele| newArr << prc.call(ele) }

    return newArr.join(" ")

end

########################################################################
# greater_proc_value
#   should accept a number and two procs as args 
#   should return the greater result of the two procs when each is passed the 
#   number

def greater_proc_value(num, prc1, prc2)
    val1 = prc1.call(num)
    val2 = prc2.call(num)

    if val1 > val2
        return val1
    else 
        return val2
    end
end


########################################################################
# and_selector
#   should accept an array and two procs as args
#   should return a new array containing elements of the original array that 
#   result in true when passed into both procs 

def and_selector(array, prc1, prc2)
    trueArr = []

    array.each { |ele| trueArr << ele if prc1.call(ele) && prc2.call(ele) }

    return trueArr
end

########################################################################
# alternating_mapper
#   should accept an array and two procs as args 
#   should return a new array where all of the elements at even indices are 
#   the results when those elements are passed into the first proc and all of the 
#   elements at odd indices are the results when those elements are passed into 
#   the second proc 

def alternating_mapper(array, prc1, prc2)
    count = 0
    newArr = []

    array.each do |ele|
        if count.even?
            newArr << prc1.call(ele)
        else 
            newArr << prc2.call(ele)
        end
        count += 1
    end

    return newArr
end

