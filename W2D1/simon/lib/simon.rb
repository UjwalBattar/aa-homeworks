class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over == true
      take_turn
    end
    game_over_message
    reset_game

  end

  def take_turn
    show_sequence
    system "clear"
    require_sequence

    round_success_message
    self.sequence_length += 1
  end

  def show_sequence
    add_random_color
    p self.seq
    sleep (self.sequence_length* 0.5)
  end

  def require_sequence
    colors_left = self.seq.length
    guesses = []
    until colors_left == 0
      puts "#{colors_left} color/s left to guess"
      guess = gets.chomp
      # system "clear"
      guesses << guess
      colors_left -= 1
    end
    p guesses
    if guesses == self.seq
      @game_over = false
    else
      @game = true
    end

  end

  def add_random_color
    self.seq += COLORS.sample(1)
  end

  def round_success_message
      puts "Good job! Your streak is #{self.sequence_length}"
      sleep 0.75
      system "clear"
  end

  def game_over_message
    puts "Game Over! Your streak was #{self.sequence_length - 1}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
