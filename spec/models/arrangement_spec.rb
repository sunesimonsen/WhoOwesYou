require 'spec_helper' 
require 'set'

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
      subject.total_expenses.should == 570
    end

    it "should return zero when no expenses are present" do
      subject.stub(:participants => []) 
      subject.total_expenses.should == 0
    end
  end 

  describe "average_expenses" do
    it "should return the average expenses over all the participants" do
      participants = [double(:total_expenses => 251),
                      double(:total_expenses => 320)]
      subject.stub(:participants => participants) 
      subject.average_expenses.should == 285.5
    end

    it "should return zero when no expenses are present" do
      subject.stub(:participants => []) 
      subject.average_expenses.should == 0
    end
  end 

  describe "debitors" do
    let(:participants) do
      participants = [double(:name => "Participant 1", :in_debt? => true,  :debt => 123),
                      double(:name => "Participant 2", :in_debt? => false, :debt => 0),
                      double(:name => "Participant 3", :in_debt? => true,  :debt => 23)]
    end 

    it "is empty when there are no participants" do
      subject.stub(:participants => []) 
      subject.debitors.should be_empty
    end

    it "it contains the participants with debt" do
      subject.stub(:participants => participants) 
      expected = ["Participant 1", "Participant 3"]
      subject.debitors.map(&:name).should == expected
    end 
  end

  describe "creditors" do
    let(:participants) do
      participants = [double(:name => "Participant 1", :has_claim? => true,  :claim => 123),
                      double(:name => "Participant 2", :has_claim? => false, :claim => 0),
                      double(:name => "Participant 3", :has_claim? => true,  :claim => 23)]
    end 

    it "is empty when there are no participants" do
      subject.stub(:participants => []) 
      subject.debitors.should be_empty
    end

    it "it contains the participants with claim" do
      subject.stub(:participants => participants) 
      expected = ["Participant 1", "Participant 3"]
      subject.creditors.map(&:name).should == expected
    end 
  end

  describe "settle_debt" do
    let(:ethan) {double(:name => "Ethan", :in_debt? => false, :has_claim? => true,  :claim => 40)} 
    let(:michael) {double(:name => "Michael", :in_debt? => false, :has_claim? => true,  :claim => 100)} 
    let(:john) {double(:name => "John", :has_claim? => false, :in_debt? => true, :debt => 60)}
    let(:piet) {double(:name => "Piet", :has_claim? => false, :in_debt? => true, :debt => 40)}
    let(:daniel) {double(:name => "Daniel", :has_claim? => false, :in_debt? => true,  :debt => 40)}

    let(:jane) {double(:name => "Jane", :in_debt? => true, :has_claim? => false,  :debt => 33.33)} 
    let(:charles) {double(:name => "Charles", :in_debt? => true, :has_claim? => false,  :debt => 33.33)} 
    let(:julia) {double(:name => "Julia", :in_debt? => false, :has_claim? => true,  :claim => 66.67)} 

    it "should return no transfers if there are no participants" do
      subject.stub(:participants => []) 
      subject.settle_debt.empty?.should be_true
    end

    it "all debt should be settled by returned transfers" do
      subject.stub(:participants => [michael, ethan, john, piet, daniel]) 
      transfers = subject.settle_debt

      transfers.amount.should == 140

      transfers.from(john).amount.should == 60
      transfers.from(daniel).amount.should == 40
      transfers.from(piet).amount.should == 40
      transfers.to(ethan).amount.should == 40
      transfers.to(michael).amount.should == 100
    end

    it "can floats correctly" do
      subject.stub(:participants => [julia, jane, charles]) 
      transfers = subject.settle_debt

      transfers.amount.should == 66.67
      transfers.from(jane).amount.should == 33.34
      transfers.from(charles).amount.should == 33.33
      transfers.to(julia).amount.should == 66.67
    end


    it "throws an error if the claim is bigger than the debt" do
      pending
    end

    it "throws an error if the debt is bigger than the claim" do
      pending
    end
  end 
end 
