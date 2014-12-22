class Game

  attr_reader :players, :max_score

  def initialize
    @deck = Deck.new
    @players = create_players

  end

  private
  def get_num_players
    players = []
    begin
      puts "how many players?"
      num_players = gets.chomp.to_i
      raise("must have min. of 2 players") if num_players < 2
    rescue Exception => e
      puts e.message
      retry
    end

    num_players.times do |num|
      players << Player.new("Player #{num + 1}", @deck)
    end
  end
end
