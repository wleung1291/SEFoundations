require_relative "board"
require_relative "player"

class Battleship
    # should take in a number, n, representing the length of the board
    # should set @player to a new Player instance
    # should call Board::new with the given length
    # should set @board to a Board instance with size n * n
    # should set @remaining_misses to half the size of the board
    def initialize(board_length)
        @player = Player.new()
        @board = Board.new(board_length)
        @remaining_misses = @board.size / 2
    end

    attr_reader :board, :player

    # should randomly place ships on the @board
    # should print the number of ships placed on the @board
    def start_game
        @board.place_random_ships()
        puts "Ships: #{@board.num_ships()}"
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts 'you lose'
            return true
        end

        return false
    end

    def win?
        ships = @board.num_ships()

        if ships == 0
            puts 'you win'
            return true
        end
        
        return false
    end

    def game_over?
        if lose? || win?
            return true
        end

        return false
    end

    # should get a move from the @player
    # should attack the position specified by the @player
    # should print the @board
    # should print the new number of @remaining_misses
    def turn
        move = @player.get_move()

        if !@board.attack(move)
            @remaining_misses -= 1
        end

        @board.print()
        puts 

        puts "Remaining Ships: #{@board.num_ships()}"
        puts "Remaining Misses: #{@remaining_misses}"
    end 
end
