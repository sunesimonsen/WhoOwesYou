require 'spec_helper'

describe Expense do
  fixtures :participants

  before(:each) do
    subject.name = "Test"
    subject.amount = 123 
    subject.participant = participants(:john)
  end

  it "requires a name to be valid" do
    subject.name = nil
    subject.should_not be_valid 
    subject.name = "Test"
    subject.should be_valid 
  end 

  it "requires an amount to be valid" do
    subject.amount = nil
    subject.should_not be_valid 
    subject.amount = 123
    subject.should be_valid 
  end 

  it "requires a participant to be valid" do
    subject.participant_id = nil
    subject.should_not be_valid 
    subject.participant = participants(:john)
    subject.should be_valid 
  end 

  it "should have an amount greater than or equals to zero" do
    subject.name = "Test"
    subject.amount = -1
    subject.should_not be_valid 
    subject.amount = 0
    subject.should be_valid 
  end 
end
