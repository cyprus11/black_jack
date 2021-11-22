module ConsoleHelper
  class << self
    def print_string(str)
      puts str
    end

    def print_in_line(*attr)
      print attr.join(' ')
    end

    def user_answer
      gets.chomp
    end
  end
end