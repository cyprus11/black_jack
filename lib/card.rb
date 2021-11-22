# frozen_string_literal: true

class Card
  attr_reader :value, :name, :suit

  def initialize(name, suit, value)
    @name = name
    @value = value
    @suit = suit
  end

  def to_s
    "#{name}#{suit}"
  end
end
