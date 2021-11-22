class Game
  attr_reader :table_bank

  def initialize(gamer, dealer, deck)
    @gamer = gamer
    @dealer = dealer
    @deck = deck
    @table_bank = 0
  end

  def start
    return false unless can_start_game?
    2.times { @gamer.add_card_to_deck(@deck.card) }
    2.times { @dealer.add_card_to_deck(@deck.card) }
    @table_bank += @gamer.money_to_bank
    @table_bank += @dealer.money_to_bank

    loop do
      ConsoleHelper.game_info(self, @gamer, @dealer)
      ConsoleHelper.print_menu
      user_answer = ConsoleHelper.user_answer
      ConsoleHelper.MENU_ACTION[user_answer].call(@gamer, @deck)
      if LogicForDealer.take_card?(dealer)
        @dealer.add_card_to_deck(@deck.card)
      end

      break if @gamer.deck_size == 3 || @dealer.deck_size == 3
    end

    ConsoleHelper.game_info(self, @gamer, @dealer, false)
    winner = choose_winner
    split_money(winner)

    true
  end

  def can_start_game?
    return false if @gamer.money == 0 || @dealer.money == 0
    true
  end

  def choose_winner
    return @gamer if @gamer.deck_score == 21 || ((21 - @gamer.deck_score) < (21 - @dealer.deck_score)) || @dealer.deck_score > 21
    return @dealer if @dealer.deck_score == 21 || ((21 - @dealer.deck_score) < (21 - @gamer.deck_score)) || @gamer.deck_score > 21

    false
  end

  def restart_game
    [@gamer, @dealer, @deck].each(&:reload_deck)
    start
  end

  private

  def split_money(winner)
    if winner
      winner.money += @table_bank
      @table_bank = 0
      ConsoleHelper.print_string("Победитель: #{winner}")
    else
      @gamer.money += @table_bank / 2
      @dealer.money += @table_bank / 2
      @table_bank = 0
      ConsoleHelper.print_string('Ничья!')
    end
  end
end
