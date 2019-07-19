# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   
#    => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    #vowels = "aeiou"
    #str = ""
    #count = 0
    vowels = ['a', 'e', 'i', 'o', 'u']
    pair = []
    newArr = []
    (0...words.length).each do |i|
      (i+1...words.length).each do |i2|
      
        pair = words[i] + " " + words[i2]
        if vowels.all?{ |ele| pair.include?(ele) }
          newArr << pair
        end

        #str = words[i] + " " + words[i2]
        #vowels.each_char do |char|
        #  if str.include?(char)
        #    count += 1
        #    if count == 5
        #      newArr << str
        #    end
        #  end
        #end
        #count = 0
        ##newArr << str   
              
      end
    end
    return newArr
end



# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each { |i| return true if num % i == 0 }
        
    return false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    bigramsArr = []
    
    bigrams.each { |bigram| bigramsArr << bigram if str.include?(bigram) }
    
    return bigramsArr
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        newHash = {}

        self.each do |k,v|
            if prc == nil
                if k == v 
                    newHash[k] = v
                end
            elsif prc.call(k, v)
                newHash[k] = v 
            end
        end
        return newHash
    end

end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        newArr = []
        newStr = ""
        
        # find every combination
        (0...self.length).each do |i1|
            (i1...self.length).each do |i2|
                newStr = self[i1..i2]
                newArr << newStr
            end
        end

        # return combinations based on the length
        if length == nil
            return newArr
        else
            newArr.select { |str| str.length == length }
        end

    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        str = ''
        alpha = ('a'..'z').to_a

        self.each_char do |char|
            start = alpha.index(char)
            newPos = (start + num) % 26
            str += alpha[newPos]
        end
        
        return str
    end
end
