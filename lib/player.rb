class Player
  attr_reader :name

  def initialize(name, role)
    @name = name
    @role = role
  end

  def player?
    @role == 'user'
  end

  def dealer?
    @role == 'dealer'
  end
end