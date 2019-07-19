class Room

    def initialize(cap)
        @capacity = cap
        @occupants = []
    end

    def capacity
        return @capacity
    end

    def occupants
        return @occupants
    end

    def full?
        if @occupants.length < @capacity
            return false
        end

        if @occupants.length == @capacity
            return true
        end
    end

    def available_space
        available = @capacity - @occupants.length 

        return available
    end

    def add_occupant(name)
        if !full?()
            @occupants << name
            return true
        end

        return false
    end
    

end
