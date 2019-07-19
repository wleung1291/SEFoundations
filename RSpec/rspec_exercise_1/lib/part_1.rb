
def average(num1, num2)
    return (num1 + num2) / 2.0
end

#############################################################################
def average_array(array)
    sum = array.inject { |acc, ele| acc + ele }
    return sum / (array.length * 1.0)
end

#############################################################################
def repeat(str, num)
    newStr = ""

    num.times{ newStr += str }

    return newStr
end

#############################################################################
def yell(str)
    
    return str.upcase + "!"
end

#############################################################################
def alternating_case(str)
    sentArr = str.split(" ")
    newArr = []

    sentArr.each_with_index do |ele, i|
        if i % 2 == 0
            newArr << ele.upcase
        else
            newArr << ele.downcase
        end

    end

    return newArr.join(" ")
end