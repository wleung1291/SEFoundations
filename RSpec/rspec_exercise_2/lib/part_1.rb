#   Should accept an array and a number as args.
#   Should return a 2D array of length 2 where the first subarray contains 
#   elements less than the number arg and the second subarray contains elements 
#   greater than or equal to the number arg.
#   Should not use the built-in Array#partition.

def partition(array, num)
    greater = []
    less = []
    arr = []

    array.each do |ele|
        if ele >= num
            greater << ele
        else
            less << ele
        end
    end

    arr << less
    arr << greater

    return arr 

end

######################################################################
#   should accept two hashes as args
#   should return a new hash representing containing key-value from both hashes
#   should take the value from the second hash if the two hashes have duplicate keys
#   should not mutate the two input hashes

def merge(hash1, hash2)
    newHash = {}

    hash1.each {|key, val| newHash[key] = val }
    hash2.each {|key, val| newHash[key] = val }
    
    return newHash
end

######################################################################
#   should accept a sentence and an array of curse words as args
#   should return the sentence where every curse word has it's vowels replaced with '*'

def censor(sentence, curse)
    vowels = "aeiou"
    sent = sentence.split(" ")
    newArr = []

    sent.each do |ele|
        if curse.include?(ele.downcase)
            word = ""
            ele.each_char do |char|
                if vowels.include?(char.downcase)
                    word += "*"
                else
                    word += char
                end
            end
            newArr << word
        else
            newArr << ele
        end
    end

    return newArr.join(" ")
end

######################################################################
#   should accept a number as an arg
#   when the number is a power of two, should return true
#   when the number is not a power of two, should return false

def power_of_two?(num)
    product = 1
    iterate = num

    iterate.times do 
        product *= 2
        return true if product == num || num == 1
    end

    return false
end