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

  describe "dept" do
    it "should be zero if the total expenses is greater than or equal to the average expenses of the arrangement" do
      subject.arrangement.stub(:average_expenses => 100)
      subject.stub(:total_expenses => 101)
      subject.dept.should eql(0)
    end

    it "should be the difference between the total expenses and the average expenses of the arrangement" do
      subject.arrangement.stub(:average_expenses => 100)
      subject.stub(:total_expenses => 51)
      subject.dept.should eql(49)
    end
  end 

  describe "claim" do
    it "should be zero if the total expenses is less than or equal to the average expenses of the arrangement" do
      subject.arrangement.stub(:average_expenses => 100)
      subject.stub(:total_expenses => 34)
      subject.claim.should eql(0)
    end

    it "should be the difference between the total expenses and the average expenses of the arrangement" do
      subject.arrangement.stub(:average_expenses => 100)
      subject.stub(:total_expenses => 134)
      subject.dept.should eql(34)
    end
  end 
end 
