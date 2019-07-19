# Write a method, least_common_multiple, that takes in two numbers and returns 
#   the smallest number that is a mutiple of both of the given numbers
def least_common_multiple(num_1, num_2)
    mul = num_1 * num_2

    (1..mul).each do |i|
        if i % num_1 == 0 && i % num_2 == 0
            return i
        end
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the 
# two adjacent letters that appear the most in the string.
def most_frequent_bigram(str)
    bigram = Hash.new(0)
    string = ""
    (0...str.length-1).each do |i|
        string = str[i] + str[i+1]
        bigram[string] += 1
    end

    sorted = bigram.sort_by {|k, v| v}
    return sorted.last[0]

end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value
    #    pairs are swapped
    def inverse
        swap = {}

        self.each do |k, v|
            swap[v] = k
        end

        return swap
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number 
    #   returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        pairs = 0

        (0...self.length).each do |i1|
            (i1+1...self.length).each do |i2|
                if self[i1] + self[i2] == num
                    pairs += 1
                end
            end
        end

        return pairs
    end


    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)
        if prc == nil
            return self.sort!
        end

        (0...self.length).each do |i1|
            (i1 + 1...self.length).each do |i2|
                if prc.call(self[i1], self[i2]) == 1
                    self[i1], self[i2] = self[i2], self[i1]
                end
            end
        end
        return self
    end
end
