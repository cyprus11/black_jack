class Player
  attr_accessor :money
  attr_reader :name, :deck

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

  private

  def count_score(card)
    if card.name == 'A' && @deck_score >= 10
      @deck_score += 1
    else
      @deck_score += card.value
    end
  end
end