class Dog

    def initialize( name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    # getters
    def name
        return @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def favorite_foods
        @favorite_foods
    end

    # setters
    def age=(num)
        @age = num
    end

    #instance methods
    def bark
        if @age <= 3
            return @bark.downcase         
        end

        return @bark.upcase
    end

    def favorite_food?(food)
        
        return @favorite_foods.include?(food.capitalize)
    end

end
