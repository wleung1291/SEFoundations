require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(instance)
        p "Exact matches: #{@secret_code.num_exact_matches(instance)}"
        p "Near matches: #{@secret_code.num_near_matches(instance)}"
    end

    def ask_user_for_guess
        p "Enter a code"
        input = gets.chomp
        code = Code.from_string(input)

        print_matches(code)
        @secret_code == code
    end
end
