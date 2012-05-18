describe "Creditor" do
  let(:subject) { Creditor.new double(:name => "Creditor", :claim => 120) }

  describe "collect_debt" do
    context "when debt is less that the claim" do
      it "should collect all debt" do
        debitor = Debitor.new double(:name => "Debitor", :debt => 80)
        transfer = subject.collect_debt debitor

        subject.claim.should == 40
        debitor.debt.should == 0
        transfer.from.name.should == "Debitor"
        transfer.to.name.should == "Creditor"
        transfer.amount.should == 80
      end 
    end 

    context "when debt is greater that the claim" do
      it "should collect debt corresponding to claim" do
        debitor = Debitor.new double(:name => "Debitor", :debt => 130)
        transfer = subject.collect_debt debitor

        subject.claim.should == 0
        debitor.debt.should == 10
        transfer.from.name.should == "Debitor"
        transfer.to.name.should == "Creditor"
        transfer.amount.should == 120
      end
    end 
  end

end
