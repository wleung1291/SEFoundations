######################################################################

def palindrome?(str)
    str.each_char.with_index do |char, i|
        if str[i] != str[-i - 1]
            return false
        end
    end
    return true
end

######################################################################
#   should accept a string as an arg
#   should return an array containing all substrings of the given string
#   Ex. substrings("abc")).to match_array ["a", "ab", "abc", "b", "bc", "c"]

def substrings(str)
    i = 0
    j = 0
    subArr = []

    while i < str.length
        sub = ""
        j = i
        while j < str.length
            sub += str[j]
            subArr << sub
            j += 1
        end
        i += 1
    end
    return subArr
end

######################################################################
#   Should accept a string as an arg.
#   Should return an array containing all substrings that are palindromes and
#   longer than 1 character.

def palindrome_substrings(str)
    palSub = []
    subStr = substrings(str)

    subStr.each do |ele|
        if palindrome?(ele) && ele.length > 1
            palSub << ele
        end
    end

    return palSub

end