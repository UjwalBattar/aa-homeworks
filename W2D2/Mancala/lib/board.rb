require "byebug"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){[]}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups[0..5].each do |cup|
      4.times do
        cup << :stone
      end
    end
      cups[7..12].each do |cup|
        4.times do
          cup << :stone
        end
      end
  end

  def valid_move?(start_pos)
    unless [0..13].include?(start_pos) || start_pos.nil?
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    # debugger
    start_stones = self.cups[start_pos]
    self.cups[start_pos] = []
    start_stones
    idx = start_pos
    if current_player_name == @name1
      until start_stones.empty?
        idx += 1
        idx = idx % 14
        idx = 0 if idx == 13
        self.cups[idx] << start_stones.shift
      end
    else
      until start_stones.empty?
        idx += 1
        idx = idx % 14
        idx = 0 if idx == 14
        idx = 7 if idx == 6
        self.cups[idx] << start_stones.shift
      end
    end


    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 ||ending_cup_idx == 13
      :prompt
    elsif self.cups[ending_cup_idx].length == 1
      :switch
    else

    ending_cup_idx
    end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    self.cups[0..5].all? { |cup| cup.empty? } ||
    self.cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    case self.cups[6].count <=> self.cups[13].count
    when -1
      @name2
    when 0
      :draw
    when 1
      @name1
    end
  end
end
