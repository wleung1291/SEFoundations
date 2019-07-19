
# all_words_capitalized?
#   should accept an array of words as an arg
#   should use Array#all?
#   when all words are properly capitalized (first letter of word uppercase, other letters lowercase)
#     should return true
#   when at least one word is not capitalized
#     should return false

def all_words_capitalized?(array)
    return array.all? { |ele| ele == ele.capitalize }
end

########################################################################
# no_valid_url?
#   should accept an array of urls as an arg
#   should use Array#none?
#   when none of the urls end in '.com', '.net', '.io', or '.org'
#     should return true
#   when at least one of the urls end in '.com', '.net', '.io', or '.org'
#     should return false

def no_valid_url?(array)
    url = ['.com', '.net', '.io', '.org']

    array.none? do |ele| 
        url.any? { |ending| ele.end_with?(ending) } 
    end
end

########################################################################
# any_passing_students?
#   should accept an array of student hashes as an arg
#   should use Array#any?
#   when at least one student has an average grade of 75 or higher
#     should return true
#   when no student has an average grade of 75 or higher
#     should return false#

def any_passing_students?(array)
    avg = 0
    array.any? do |hash|
        hash.each do
            grades = hash[:grades]
            avg = grades.sum / ( grades.length * 1.0 )
        end

        avg >= 75
    end
end


