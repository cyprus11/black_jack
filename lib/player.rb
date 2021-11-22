class Player
  attr_accessor :money
  attr_reader :name, :deck, :deck_score

  def initialize(name, role)
    @name = name
    @role = role
    @deck = []
    @money = 100
    @deck_score = 0
  end

  def add_card_to_deck(card)
    @deck << card
    count_score(card)
  end

  def dealer?
    @role == 'dealer'
  end

  def player?
    @role == 'user'
  end

  def print_deck(secure = false)
    if secure
      @deck.map { |card| card = '*' }.join(' ')
    else
      @deck.map(&:to_s).join(' ') << " - #{@deck_score}"
    end
  end

  def money_to_bank
    @money -= 10
    10
  end

  private

  def count_score(card)
    if card.name == 'A' && @deck_score >= 10
      @deck_score += 1
    else
      @deck_score += card.value
    end
  end
end