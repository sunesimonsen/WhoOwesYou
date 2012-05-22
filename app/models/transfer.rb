class Transfer
  attr_reader :from, :to, :amount

  def initialize data
    @from = data[:from]
    @to = data[:to]
    @amount = data[:amount]
  end 

  def hash
    [@from, @to, @amount].hash
  end 

  def ==(other)
    self.eql? other
  end 

  def eql? other
    [@from, @to, @amount] == [other.from, other.to, other.amount] 
  end 
end 
