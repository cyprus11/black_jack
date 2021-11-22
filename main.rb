# frozen_string_literal: true

require_relative 'lib/console_helper'
require_relative 'lib/card'
require_relative 'lib/deck'
require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/logic_for_dealer'

ConsoleHelper.print_string('Добрый вечер! Введите ваше имя: ')
user_name = ConsoleHelper.user_answer

gamer = Player.new(user_name)
dealer = Player.new('Дилер')
deck = Deck.new

game = Game.new(gamer, dealer, deck)

loop do
  break unless game.start

  ConsoleHelper.print_string('Хотите повторить игру?(да/нет)')
  break if ConsoleHelper.user_answer.downcase == 'нет'

  game.reload_decks
end

ConsoleHelper.print_string('Игра закончена.')
