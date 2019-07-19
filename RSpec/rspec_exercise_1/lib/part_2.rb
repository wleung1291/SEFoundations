
#should accept a word as an arg
#should return the word with it's last vowel (a, e, i, o, u) removed
#should return the original word if it contains no vowels

def hipsterfy(word)
    vowel = "aeiou"
    wordArr = word.split("")
    i = wordArr.length - 1

    while i >= 0
        if vowel.include?(wordArr[i])
            wordArr.delete_at(i)
            return wordArr.join("")
        end
        i -= 1
    end
    return word
end

#############################################################################
# should accept string as an arg
# should return a hash where each key is a vowel of string and 
# it's value is the number of times it appearsdef vowel_counts(str)

def vowel_counts(str)
    vowel = "aeiou"
    vowelHash = Hash.new(0)
    string = str.downcase

    string.each_char do |char|
        if vowel.include?(char)
            vowelHash[char] += 1 
        end
    end

    return vowelHash
end

#############################################################################
# should accept a message and a number (n) as an arg
# should return a new string where every letter of the message is shifted 
# n positions in the alphabet should not modify non-alphabetic characters

def caesar_cipher(str, num)
    alpha = ("a".."z").to_a
    newStr = ""
   
    str.each_char do |char|
        if alpha.include?(char) # only check for alphabetic character
            oldInd = alpha.index(char) # get the index where char is 

            # add the old index to the number of times to shift to get new index
            newInd = oldInd + num 
            
            # get the remainder which is where the char is at shifted num times
            newCharAtNewInd = newInd % alpha.length 

            newStr += alpha[newCharAtNewInd]
        else
            newStr += char 
        end
    end

    return newStr
end