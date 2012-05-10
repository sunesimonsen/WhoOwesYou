require 'spec_helper' 

describe Arrangement  do

  it "requires a name to be valid" do
    subject.should_not be_valid 
    subject.name = "Test"
    subject.should be_valid 
  end 

  describe "total_expenses" do
    it "should return the sum the total_expenses of each participant" do
      participants = [double(:total_expenses => 250),
                      double(:total_expenses => 320)]
      subject.stub(:participants => participants) 
      subject.total_expenses.should eql(570)
    end

    it "should return zero when no expenses are present" do
      subject.stub(:participants => []) 
      subject.total_expenses.should eql(0)
    end
  end 

  describe "average_expenses" do
    it "should return the average expenses over all the participants" do
      participants = [double(:total_expenses => 251),
                      double(:total_expenses => 320)]
      subject.stub(:participants => participants) 
      subject.average_expenses.should eql(285.5)
    end

    it "should return zero when no expenses are present" do
      subject.stub(:participants => []) 
      subject.average_expenses.should eql(0)
    end
  end 

  describe "debitors" do
    let(:participants) do
      participants = [double("Participant 1", :in_debt? => true, :debt => 123),
                      double("Participant 2", :in_debt? => false, :debt => 0),
                      double("Participant 3", :in_debt? => true, :debt => 23)]
    end 

    it "is empty when there are no participants" do
      subject.stub(:participants => []) 
      subject.debitors.should be_empty
    end

    it "it contains the participants with debt" do
      subject.stub(:participants => participants) 
      expected = [participants[0], participants[2]]
      subject.debitors.should eql(expected)
    end 
  end

end 
