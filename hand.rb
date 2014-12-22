require_relative 'deck'

class Hand
  def self.deal_from(deck)
    Hand.new(deck.draw(8))
  end

  attr_reader :cards

  def initialize(cards = Hand.deal_from(deck))
    @cards = cards
  end

  def hand_score
    hand_score = 0
    @cards.each { |card| hand_score += card.crazy8_value }

    hand_score
  end

  def count
    @cards.count
  end

  def return_cards(deck)
    deck.stockpile.return(@cards)
    @cards = []
  end

  def empty?
    @cards.empty?
  end
end
