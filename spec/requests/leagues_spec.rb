require 'spec_helper'

describe "Leagues" do
  describe "GET /leagues" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get leagues_path
      response.status.should be(302)
    end
  end
end
