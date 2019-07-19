class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(char_arr)
    char_arr.each do |ele|
      if !POSSIBLE_PEGS.include?(ele.upcase)
        return false
      end
    end
      
    return true
  end

  def initialize(peg_arr)
    if Code.valid_pegs?(peg_arr)
      @pegs = peg_arr
      @pegs.map! { |ele| ele.upcase }
    else
      raise "invalid peg"
    end
  end

  def self.random(length)
    random = []

    length.times do
      random << POSSIBLE_PEGS.keys.sample
    end

    Code.new(random)
  end

  def self.from_string(pegs_str)
    pegs_char_arr = pegs_str.split("")

    return Code.new(pegs_char_arr)
  end
  
  def [](index)
    @pegs[index] # same as @pegs.[](index)
  end

  def length
    return @pegs.length
  end

  def num_exact_matches(guess)
    count = 0

    @pegs.each_with_index do |ele, i|
      if self.pegs[i] == guess[i]
        count += 1
      end
    end

    return count
  end

  def num_near_matches(guess)
    count = 0

    (0...guess.length).each_with_index do |i|
      if self.pegs[i] != guess[i] && self.pegs.include?(guess[i])
        count += 1
      end
    end

    return count
  end
  
  def ==(another_peg)
    #if self.pegs.length == another_peg.length
    #  (0...self.pegs.length).each do |i|
    #    return false if self.pegs[i] != another_peg[i]
    #  end
    #  return true
    #end
    #
    #return false

    return self.pegs == another_peg.pegs
  end


end
