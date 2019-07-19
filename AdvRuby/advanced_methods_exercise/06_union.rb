# Write a method, union, that accepts any number of arrays as arguments.
# The method should return an array containing all elements of the given arrays.

def union(*args)

    args.inject { |acc, ele| acc + ele}
    # concatenates ele to acc
    # 1 
    # acc = ["x", "y"]
    # ele = [true, false]
    # acc = ["x", "y", true, false]
    # 2
    # acc = ["x", "y", true, false]
    # ele = [20, 21, 23]
    # acc = ["x", "y", true, false, 20, 21, 23]
    
end

p union(["a", "b"], [1, 2, 3]) # => ["a", "b", 1, 2, 3]
p union(["x", "y"], [true, false], [20, 21, 23]) # => ["x", "y", true, false, 20, 21, 23]
