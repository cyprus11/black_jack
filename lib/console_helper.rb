module ConsoleHelper
  class << self
    def print_info(str)
      puts str
    end

    def print_in_lint(*attr)
      print attr.join(' ')
    end
  end
end