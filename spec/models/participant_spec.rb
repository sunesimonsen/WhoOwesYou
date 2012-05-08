require File.dirname(__FILE__)+'/../spec_helper'

describe Participant do


  it "requires a user and an arragement to be valid" do
    subject.should_not be_valid
    subject.user = User.create :name => "User"
    subject.arrangement = Arrangement.create :name => "Arrangement"
    subject.should be_valid
  end 

end 
