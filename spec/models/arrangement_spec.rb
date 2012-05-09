require 'spec_helper' 

describe Arrangement  do

  it "requires a name to be valid" do
    subject.should_not be_valid 
    subject.name = "Test"
    subject.should be_valid 
  end 

  describe "total_expenses" do
    it "should return the sum the total_expenses of each participant" do
      participants = [double("Participant 1", :total_expenses => 250), double("Participant 2", :total_expenses => 320)]
      subject.stub(:participants => participants) 
      subject.total_expenses.should eql(570)
    end

    it "should return zero when no expenses are present" do
      subject.stub(:participants => []) 
      subject.total_expenses.should eql(0)
    end
  end 
end 
