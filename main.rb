require_relative 'lib/console_helper'
require_relative 'lib/card'
require_relative 'lib/deck'
require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/logic_for_dealer'

ConsoleHelper.print_string('Добрый вечер! Введите ваше имя: ')
user_name = ConsoleHelper.user_answer

gamer = Player.new(user_name, 'user')
dealer = Player.new('Дилер', 'dealer')
deck = Deck.new

game = Game.new(gamer, dealer, deck)
if game.start
  ConsoleHelper.print_string('Хотите повторить игру?(да/нет)')
  game.restart_game if ConsoleHelper.user_answer.downcase == 'да'
else
  ConsoleHelper.print_string('Игра закончена, так как у вас или у диллера нет денег на ставку: ')
end
ConsoleHelper.game_info(game, gamer, dealer, false)