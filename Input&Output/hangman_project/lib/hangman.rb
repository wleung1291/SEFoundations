class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    return DICTIONARY.sample()
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    return @guess_word
  end

  def attempted_chars
    return @attempted_chars
  end

  def remaining_incorrect_guesses
    return @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    end

    return false
  end

  def get_matching_indices(char)
    indices = []

    @secret_word.each_char.with_index do |ele, i|
      if ele == char
        indices << i
      end
    end

    return indices
  end

  def fill_indices(char, iArray)
    iArray.each do |ele|
      @guess_word[ele] = char
    end
  end

  def try_guess(char)
    attempted = already_attempted?(char)
    matchingI = get_matching_indices(char)

    if matchingI.length == 0
      @remaining_incorrect_guesses -= 1
    else
      fill_indices(char, matchingI)
    end
    
    if attempted
      p 'that has already been attempted'
      return false
    end

    @attempted_chars << char
    return true
  end

  def ask_user_for_guess
    p 'Enter a char:'
    char = gets.chomp
    return try_guess(char)
  end

  def win?
    if guess_word().join("") == @secret_word
      p 'WIN'
      return true
    end

    return false
  end

  def lose?
    if remaining_incorrect_guesses() == 0
      p "LOSE"
      return true
    end

    return false
  end

  def game_over?
    if win?() || lose?()
      p @secret_word
      return true
    end

    return false
  end

end
