def select_even_nums(array)

    # return array.select { |ele| ele.even? }

    return array.select(&:even?) 
end

########################################################################

def reject_puppies(array)

    return array.reject{ |ele| ele["age"] <= 2}

end

########################################################################

def count_positive_subarrays(array)
     
    return array.count { |subArr| subArr.sum > 0 }
        
end

########################################################################

def aba_translate(string)
    vowel = "aeiou"
    newStr = ""

    string.each_char do |char|
        if vowel.include?(char)
            newStr = newStr + char + "b"
        end
        newStr += char
    end

    return newStr
end

########################################################################

def aba_array(array)
    return array.map { |ele| aba_translate(ele) }
end