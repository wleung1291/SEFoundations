class Employee

    # getter methods for name and title
    attr_reader :name, :title

    def initialize(name, title)
        @name = name
        @title = title
        @earnings = 0
    end

    def pay(amount)
        @earnings = @earnings + amount
    end
    
end
