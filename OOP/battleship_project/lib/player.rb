class Player

    #  should print 'enter a position with coordinates separated with a space like `4 7`'
    #  it should call gets.chomp to get input from the user
    #  should return an array containing the player's two input numbers as integers
    def get_move
        puts 'enter a position with coordinates separated with a space like `4 7`'

        str = gets.chomp.split(" ")
        
        return str.map! { |ele| ele.to_i }
    end 

end
