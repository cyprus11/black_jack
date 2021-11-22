# frozen_string_literal: true

class Game
  attr_reader :table_bank

  MENU_ACTION = {
    '1': proc { ConsoleHelper.print_string('Игрок пропустил ход') },
    '2': proc { |player, deck|
      player.add_card_to_deck(deck.card) if player.deck_size < 3
      true
    },
    '3': proc { false }
  }.freeze

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
      break unless MENU_ACTION[user_answer.to_sym].call(@gamer, @deck)

      if LogicForDealer.take_card?(@dealer)
        @dealer.add_card_to_deck(@deck.card)
      else
        ConsoleHelper.print_string('Дилер пропустил ход')
      end

      break if @gamer.deck_size == 3 && @dealer.deck_size == 3
    end

    ConsoleHelper.game_info(self, @gamer, @dealer, false)
    winner = choose_winner
    split_money(winner)

    true
  end

  def can_start_game?
    return false if @gamer.money.zero? || @dealer.money.zero?

    true
  end

  def choose_winner
    if @gamer.deck_score == 21 ||
       (((21 - @gamer.deck_score) < (21 - @dealer.deck_score)) &&
        @gamer.deck_score < 21)
      return @gamer
    end
    if @dealer.deck_score == 21 ||
       @gamer.deck_score > 21 ||
       (((21 - @dealer.deck_score) < (21 - @gamer.deck_score)) && @dealer.deck_score < 21)
      return @dealer
    end

    false
  end

  def reload_decks
    [@gamer, @dealer, @deck].each(&:reload_deck)
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
