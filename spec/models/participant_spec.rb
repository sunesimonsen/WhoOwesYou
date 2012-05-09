require 'spec_helper' 

describe Participant do
  fixtures :users, :arrangements

  it "requires a user and an arragement to be valid" do
    subject.should_not be_valid
    subject.user = users :john
    subject.arrangement = arrangements :party
    subject.should be_valid
  end 

  it "have the same name as its user" do
    subject.user = users :john
    subject.user.name = "user name"
    subject.name.should eql("user name")
  end

  describe "total_expenses" do
    it "should return the sum of all expenses" do
      expenses = [double("Expense 1", :amount => 250), double("Expense 2", :amount => 100)]
      subject.stub(:expenses => expenses) 
      subject.total_expenses.should eql(350)
    end

    it "should return zero when no expenses are present" do
      subject.stub(:expenses => []) 
      subject.total_expenses.should eql(0)
    end
  end
end 
