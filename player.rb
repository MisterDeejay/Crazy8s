require_relative 'hand'

class Player
  attr_reader :name, :hand, :deck, :player_score

  def initialize(name, deck)
    @name, @deck = name, deck
    @hand = Hand.new(deal_from(@deck))
    @player_score = 0
  end

  def add_to_player_score(pts_from_round)
    @player_score += pts_from_round if won?
  end

  def won?(players)
    players.each do |player|
      return false if player.hand.empty?
    end

    hand.empty?
  end

  def place_card(card)
    begin
      raise("not a valid move") unless @deck.is_valid_move?(card)
      @hand.cards.delete(card)
      @deck.discard(card)
    rescue Exception => e
      puts e.message
    end
  end

  def draw_card
    @hand.cards.each do |card|
      if @deck.is_valid_move?(card)
        raise("you cannot draw cards, you have a valid move")
      end
    end

    @hand.cards << @deck.draw(1)
  end
end
