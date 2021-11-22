module LogicForDealer
  def self.take_card?(dealer)
    return true if dealer.deck_score < 17
    false
  end
end