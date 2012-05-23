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
    let(:ethan) {double(:name => "Ethan", :has_claim? => true,  :claim => 80)} 
    let(:michael) {double(:name => "Michael", :has_claim? => true,  :claim => 20)} 
    let(:john) {double(:name => "John", :in_debt? => true, :debt => 60)}
    let(:daniel) {double(:name => "Daniel", :in_debt? => true,  :debt => 40)}

    it "should return no transfers if there are no participants" do
      subject.stub(:participants => []) 
      subject.settle_debt.empty?.should be_true
    end

    it "all debt should be settled by returned transfers" do
      subject.stub(:creditors => [Creditor.new(michael), Creditor.new(ethan)])
      subject.stub(:debitors => [Debitor.new(john), Debitor.new(daniel)])
      transfers = subject.settle_debt

      transfers.amount.should == 100

      transfers.from(john).amount.should == 60
      transfers.from(daniel).amount.should == 40
      transfers.to(ethan).amount.should == 80
      transfers.to(michael).amount.should == 20

      transfers.count.should == 3
    end

    it "throws an error if the claim is bigger than the debt" do
      pending
    end

    it "throws an error if the debt is bigger than the claim" do
      pending
    end
  end 

end 
