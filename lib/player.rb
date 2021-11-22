# frozen_string_literal: true

class Player
  attr_accessor :money
  attr_reader :name, :deck, :deck_score

  def initialize(name)
    @name = name
    @deck = []
    @money = 100
    @deck_score = 0
  end

  def add_card_to_deck(card)
    @deck << card
    count_score(card)
  end

  def deck_size
    @deck.size
  end

  def print_deck(secure = false)
    if secure
      @deck.map { |_card| '*' }.join(' ')
    else
      @deck.map(&:to_s).join(' ') << " - #{@deck_score}"
    end
  end

  def money_to_bank
    @money -= 10
    10
  end

  def to_s
    "имя: #{name}, баланс: #{money}"
  end

  def reload_deck
    @deck = []
    @deck_score = 0
  end

  private

  def count_score(card)
    @deck_score += if card.name == 'A' && @deck_score >= 10
                     1
                   else
                     card.value
                   end
  end
end
