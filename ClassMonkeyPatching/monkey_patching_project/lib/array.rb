# Monkey-Patch Ruby's existing Array class to add your own custom methods

class Array
    #   #span
    #     when the array contains numbers as elements
    #       should return the difference between the largest and smallest element 
    #     when the array is empty should return nil 
    #   #average
    #     when the array contains numbers as elements
    #       should return a number representing the average value of the elements 
    #     when the array is empty should return nil 
    #   #median
    #     when there is an odd number of elements
    #       should return the middle element of the array when sorted 
    #     when there is an even number of elements
    #       should return the average of the two middle elements when sorted 
    #     when the array is empty should return nil 
    #   #counts
    #     should return a hash representing the count of each element of the array
    def span
        diff = 0

        return nil if !self.any? 
        
        if self.all? { |ele| ele.is_a?(Integer) }
            diff = self.max - self.min 
        end
        
        return diff
    end

    def average
        avg = 0

        return nil if self.empty? 

        if self.all? { |ele| ele.is_a?(Integer) }
            avg = self.sum / ( self.length * 1.0 )
        end

        return avg
    end

    def median
        sorted = self.sort
        mid =  sorted.length / 2

        return nil if self.empty?  

        if (sorted.length).even?
            avg = (sorted[mid] + sorted[mid - 1]) / 2.0
            return avg
        end

        return sorted[mid]
    end

    def counts
        hash = Hash.new(0)

        self.each { |ele| hash[ele] += 1 }

        return hash
    end

    #   #my_count
    #     should accept any value as an argument and return the number of times 
    #       that value appears in the array 
    #     should not use the built-in Array#count
    #   #my_index
    #     should accept any value as an argument and return the index where that 
    #       element is found in the array 
    #     should not use the built-in Array#index 
    #     when the value appears multiple times in the array
    #       should return the smallest index where it is found 
    #     when the value does not appear in the array should return nil 
    #   #my_uniq
    #     should return a new array without duplicate elements in the order they 
    #       first appeared in the original array 
    #     should not use the built-in Array#uniq 
    #   #my_transpose
    #     should transpose a 2D array with square dimensions by returning a new 
    #       2D array where the horizontal rows are converted to vertical columns 
    #     should not use the built-in Array#transpose

    def my_count(val)
        count = 0

        self.each { |ele| count += 1 if ele == val }

        return count
    end

    def my_index(val)

        if self.include?(val)
            self.each_with_index do |ele, i| 
                if ele == val
                    return i
                end
            end
        end

        return nil
    end

    def my_uniq
        uniqArr = []

        self.each do |ele|
            if !uniqArr.include?(ele)
                uniqArr << ele
            end
        end
        
        return uniqArr
    end

    def my_transpose
        newArr = []

        (0...self.length).each do |r|
            newRow = []
            (0...self.length).each do |c|
                p self[c][r]
                newRow << self[c][r]
            end
            newArr << newRow
        end

        return newArr
        
    end
end
