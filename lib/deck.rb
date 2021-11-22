class Deck
  SUITS = %w[♡ ♤ ♢ ♧].freeze
  CARDS_NAME_VALUE = {
    '2': 2,
    '3': 3,
    '4': 4,
    '5': 5,
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9,
    '10': 10,
    'J': 10,
    'Q': 10,
    'K': 10,
    'A': 11
  }

  def initialize
    @deck = []
    create_deck!
  end

  private

  def create_deck!
    SUITS.each do |suit|
      CARDS_NAME_VALUE.each do |k, v|
        @deck << Card.new(k, suit, v)
      end
    end
  end
end