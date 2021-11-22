# frozen_string_literal: true

module LogicForDealer
  def self.take_card?(dealer)
    return true if dealer.deck_score < 17 && dealer.deck_size < 3

    false
  end
end
