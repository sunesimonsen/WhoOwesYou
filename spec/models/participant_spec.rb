require 'spec_helper' 

describe Participant do
  fixtures :arrangements

  before(:each) do
    subject.name = "John"
    subject.arrangement = arrangements :party
  end 

  it "requires an arrangement to be valid" do
    subject.arrangement = nil
    subject.should_not be_valid
    subject.name = "John"
    subject.arrangement = arrangements :party
    subject.should be_valid
  end 

  describe "total_expenses" do
    it "should return the sum of all expenses" do
      expenses = [double("Expense 1", :amount => 250), double("Expense 2", :amount => 100)]
      subject.stub(:expenses => expenses) 
      subject.total_expenses.should == 350
    end

    it "should return zero when no expenses are present" do
      subject.stub(:expenses => []) 
      subject.total_expenses.should == 0
    end
  end

  describe "debt" do
    it "should be zero if the total expenses is greater than or equal to the average expenses of the arrangement" do
      subject.arrangement.stub(:average_expenses => 100)
      subject.stub(:total_expenses => 101)
      subject.debt.should == 0
    end

    it "should be the difference between the total expenses and the average expenses of the arrangement" do
      subject.arrangement.stub(:average_expenses => 100)
      subject.stub(:total_expenses => 51)
      subject.debt.should == 49
    end
  end 

  describe "in_debt?" do
    it "should be true when the debt is greater than zero" do
      subject.stub(:debt => 34)
      subject.in_debt?.should be_true
    end 
    
    it "should be false when the debt is less or equals to zero" do
      subject.stub(:debt => 0)
      subject.in_debt?.should be_false
    end 
  end 

  describe "claim" do
    it "should be zero if the total expenses is less than or equal to the average expenses of the arrangement" do
      subject.arrangement.stub(:average_expenses => 100)
      subject.stub(:total_expenses => 34)
      subject.claim.should == 0
    end

    it "should be the difference between the total expenses and the average expenses of the arrangement" do
      subject.arrangement.stub(:average_expenses => 100)
      subject.stub(:total_expenses => 134)
      subject.claim.should == 34
    end
  end 

  describe "has_claim?" do
    it "should be true when the claim is greater than zero" do
      subject.stub(:claim => 34)
      subject.has_claim?.should be_true
    end 
    
    it "should be false when the claim is less or equals to zero" do
      subject.stub(:claim => 0)
      subject.has_claim?.should be_false
    end 
  end 

  describe "balance" do
    it "should be total expenses subtracted the average expenses for the arrangement" do
      subject.arrangement.stub(:average_expenses => 100)
      subject.stub(:total_expenses => 34)
      subject.balance.should == -66
    end 
  end 
end 
