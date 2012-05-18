class Debitor
  attr_reader :participant
  delegate :name, :to => :participant

  def initialize participant
    @participant = participant
  end
end 
