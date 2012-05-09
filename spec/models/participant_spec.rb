require 'spec_helper' 

describe Participant do

  it "requires a user and an arragement to be valid" do
    subject.should_not be_valid
    subject.user = User.create :name => "User"
    subject.arrangement = Arrangement.create :name => "Arrangement"
    subject.should be_valid
  end 

  it "should return the sum of all expenses for total_amount" do
    subject.expenses << Expense.new(:name => "Beer", :amount => 250)
    subject.expenses << Expense.new(:name => "Chips", :amount => 100)
    subject.total_amount.should eql(350)
  end

end 
