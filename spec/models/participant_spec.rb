require 'spec_helper' 

describe Participant do
  fixtures :users, :arrangements

  it "requires a user and an arragement to be valid" do
    subject.should_not be_valid
    subject.user = users :john
    subject.arrangement = arrangements :party
    subject.should be_valid
  end 

  it "should return the sum of all expenses for total_amount" do
    subject.expenses << Expense.new(:name => "Beer", :amount => 250)
    subject.expenses << Expense.new(:name => "Chips", :amount => 100)
    subject.total_amount.should eql(350)
  end

  it "have the same name as its user" do
    subject.user = users :john
    subject.user.name = "user name"
    subject.name.should eql("user name")
  end

end 
