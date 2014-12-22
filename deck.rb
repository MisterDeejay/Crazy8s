require_relative 'card'

class Deck
  def self.all_cards
    cards = []

    Card.suits do |suit|
      Card.values do |value|
        begin
          cards << Card.new(suit, value)
        rescue Exception => e
          puts e.message
          puts e.backtrace.join("\n")
        end
      end
    end

    cards
  end

  attr_reader :stockpile, :discard_pile, :current_suit, :current_value

  def initialize(stockpile = Deck.all_cards)
    @stockpile = stockpile.shuffle
    @discard_pile = []
  end

  def inspect
  end

  def flip_card
    leading_card = @stockpile.shift
    puts "The top card is the #{leading_card.to_s}"
    @discard_pile.unshift(leading_card)
  end

  def draw(n)
    @stockpile.shift(n)
  end

  def discard(card)
    @discard_pile.unshift(card)
  end

  # for returning all cards at the end of the game
  def return(cards)
    @stockpile += cards
  end

  def is_valid_move?(card)
    if card.value == :eight
      puts "set current suit: (s)pades, (h)earts, (d)iamonds or (c)lubs"
      new_suit = gets.chomp
      set_suit(new_suit)
      return true
    elsif card.value == current_value
      @current_suit = card.suit
      card.unshift


    end
  end

  def set_suit(new_suit)
    case new_suit
    when 's'
      @current_suit = :spades
    when 'd'
      @current_suit = :diamonds
    when 'c'
      @current_suit = :clubs
    when 'h'
      @current_suit = :hearts
    end
  end
end
