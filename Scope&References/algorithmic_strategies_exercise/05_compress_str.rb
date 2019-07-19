# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    count = 1
    newStr = ""

    str.each_char.with_index do |char, i|
        if char == str[i + 1] # check if next characters are identical
            count += 1
        elsif count == 1 # if only one occurence, only concat the char
            newStr += char
        else 
            newStr += count.to_s + char
            count = 1
        end
    end

    return newStr
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
