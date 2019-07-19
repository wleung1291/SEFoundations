class Board
    
    #  should accept a number, n, as an arg
    #  should set @grid to be a 2D array with n rows and n columns
    #  should set all elements of @grid to :N
    #  should make each subarray of @grid refer to a distinct array
    #  should set @size to be a number representing the total size of the grid (n * n)
    def initialize(n)
        # :- is an empty space we have not touched yet
        @grid = Array.new(n){Array.new(n, :-)}
        @size = n * n
        @n = n
    end

    attr_reader :size, :n

    #  should accept an array containing a pair of indices in the form 
    #       [row, column] representing a position on the @board
    #  should return the element of @grid at the given position
    def [](rc_pos)
        return @grid[rc_pos[0]][rc_pos[1]]
    end

    #  should accept a position and value as args
    #  should set the given position of @grid to the given value
    def []=(pos, val)
        row, col = pos # pos = [1,2] then row = 1, col = 2
        return @grid[row][col] = val
    end

    #  should return a number representing the count of :S values in @grid
    def num_ships
        #count = 0
        #@grid.each do |subArr|
        #    subArr.each do |ele|
        #        if ele == :S #:S is a ship
        #            count += 1
        #        end
        #    end
        #end
        #return count

        return @grid.flatten.count { |ele| ele == :S}
    end 

    #  should accept a position as an arg
    #  should call Board#[] and Board#[]= to check and set @grid
    #  when the given position of @grid has a value of :S
    #    should set that value to :H
    #    should print 'you sunk my battleship!'
    #    should return true to indicate the attack hit a ship
    #  when the given position of @grid does not have a value of :S
    #    should set that value to :X
    #    should return false to indicate the attack missed
    def attack(pos)
        val = self[pos]
        if val == :S 
            self[pos]= :H 
            puts 'you sunk my battleship!'
            return true
        else 
            self[pos]= :X 
        end
        return false 
    end

    #  should randomly set 25% of the @grid's elements to :S
    #  should always set 25% of the @grid's elements based on the @grid's dimensions
    def place_random_ships
        rand_ships = (@size * 0.25).round

        while self.num_ships < rand_ships
            row = rand(0...@n)
            col = rand(0...@n)
            pos = [row] + [col]
            self[pos]= :S
        end
    end

    #  should return a 2D array representing the grid where every :S is replaced with an :N
    #  should not mutate the original @grid 
    def hidden_ships_grid
        newGrid = Array.new(@n){Array.new(@n)}

        @grid.each_with_index do |subArr, idx1|
            subArr.each_with_index do |ele, idx2|
                if ele == :S 
                    newGrid[idx1][idx2] = :-
                else
                    newGrid[idx1][idx2] = ele
                end
            end
        end

        return newGrid
    end

    #  should accept a 2D array representing a grid as an arg
    #  should print each row of @grid so every element in a row is separated with a space
    def self.print_grid(grid)
        puts

        # cols index
        print " "
        grid.each_with_index { |ele, i| print " #{i}" }

        puts
        
        # rows index
        i = 0
        grid.each do |row|
            print "#{i} " 
            i += 1
            puts row.join(" ")  
        end
    end

    #  should call Board::print_grid with @grid as an arg  
    def cheat
        Board.print_grid(@grid)
    end

    #  should call Board::print_grid with the #hidden_ships_grid as an arg 
    def print 
        Board.print_grid(hidden_ships_grid())
    end


end
