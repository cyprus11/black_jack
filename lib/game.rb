class Game
  attr_reader :table_bank

  def initialize(gamer, dealer, deck)
    @gamer = gamer
    @dealer = dealer
    @deck = deck
    @table_bank = 0
  end

  def start
    loop do
      break if game_finished
      2.times { @gamer.add_card_to_deck(@deck.card) }
      2.times { @dealer.add_card_to_deck(@deck.card) }
      @table_bank += @gamer.money_to_bank
      @table_bank += @dealer.money_to_bank
      ConsoleHelper.game_info(self, @gamer, @dealer)
      ConsoleHelper.print_menu

    end

    choose_winner
  end

  def check_result
  end

  def game_finished
    return true if @gamer.money == 0 || @dealer.money == 0
    false
  end

  def choose_winner
    return @gamer if @gamer.deck_score == 21
    return @dealer if @dealer.deck_score == 21
    return @gamer if (21 - @gamer.deck_score) < (21 - @dealer.deck_score)
    return @dealer if (21 - @dealer.deck_score) < (21 - @gamer.deck_score)

    false
  end
end
