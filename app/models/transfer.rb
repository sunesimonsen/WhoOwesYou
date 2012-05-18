class Transfer
  attr_reader :from, :to, :amount

  def initialize data
    @from = data[:from]
    @to = data[:to]
    @amount = data[:amount]
  end 
end 
