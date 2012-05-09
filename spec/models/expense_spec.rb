require 'spec_helper'

describe Expense do
  it "requires name to be valid" do
    subject.amount = 123 
    subject.should_not be_valid 
    subject.name = "Test"
    subject.should be_valid 
  end 

  it "requires amount to be valid" do
    subject.name = "Test"
    subject.should_not be_valid 
    subject.amount = 123
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
