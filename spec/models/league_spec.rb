require 'spec_helper'

describe League do
  it "allows only one league to be current" do
    League.create(:name => "League 1", :current => true)
    league2 = League.new
    league2.name = "Liga 2"
    league2.current = true
    league2.save
    league2.should_not be_valid
  end
end
