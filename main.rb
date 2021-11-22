require_relative 'lib/console_helper'
require_relative 'lib/card'
require_relative 'lib/deck'
require_relative 'lib/game'
require_relative 'lib/player'

ConsoleHelper.print_string('Добырй вечер! Введите ваше имя: ')
user_name = ConsoleHelper.user_answer

gamer = Player.new(user_name, 'user')
dealer = Player.new('Дилер', 'dealer')
deck = Deck.new

game = Game.new(gamer, dealer, deck)