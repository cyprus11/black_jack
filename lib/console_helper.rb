module ConsoleHelper
  class << self
    MENU = {
      '1': 'Пропустить',
      '2': 'Добавить карту',
      '3': 'Открыть карты'
    }

    def print_string(str)
      puts str
    end

    def print_in_line(*attr)
      puts
      print attr.join(' ')
    end

    def user_answer
      gets.chomp
    end

    def game_info(game, gamer, dealer, dealer_secure = true)
      print_string("Банк: #{game.table_bank}")
      print_string("#{dealer.name}: #{dealer.print_deck(dealer_secure)}")
      print_string("#{gamer.name}: #{gamer.print_deck}")
    end

    def print_menu
      MENU.each do |k, v|
        print_string("#{k}. #{v}")
      end
    end
  end
end